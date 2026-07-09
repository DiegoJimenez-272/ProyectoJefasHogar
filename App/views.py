import json
import os
from django.conf import settings
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.db.models import Count
from .models import Emprendedora, Producto, Proceso, Zona, Noticia
from decimal import Decimal, InvalidOperation

def clean_price(value):
    try:
        if not value:
            return Decimal('0.00')
        # Clean currency symbol, spaces
        val_str = str(value).replace('$', '').replace(' ', '').strip()
        
        # Standardize decimal separator to dot
        # If there are multiple dots, they must be thousands separators:
        if val_str.count('.') > 1:
            val_str = val_str.replace('.', '')
            
        # Try direct decimal conversion first
        try:
            dec_val = Decimal(val_str)
        except InvalidOperation:
            # Handle commas
            if ',' in val_str and '.' in val_str:
                # e.g., "15.000,00" -> "15000.00"
                val_str = val_str.replace('.', '').replace(',', '.')
            elif ',' in val_str:
                parts = val_str.split(',')
                if len(parts) == 2 and len(parts[1]) == 3:
                    # e.g. "15,000" -> "15000" (thousands separator)
                    val_str = val_str.replace(',', '')
                else:
                    # e.g. "15,00" -> "15.00" (decimal separator)
                    val_str = val_str.replace(',', '.')
            dec_val = Decimal(val_str)
            
        # Ensure it fits in Decimal(10,2) i.e. max 99,999,999.99
        max_val = Decimal('99999999.99')
        min_val = Decimal('-99999999.99')
        if dec_val > max_val:
            return max_val
        if dec_val < min_val:
            return Decimal('0.00')
        return dec_val
    except Exception:
        return Decimal('0.00')

def get_custom_hero_image(image_key, default_url):
    extensions = ['.png', '.jpg', '.jpeg', '.webp']
    for ext in extensions:
        filename = f"{image_key}{ext}"
        file_path = os.path.join(settings.MEDIA_ROOT, 'hero', filename)
        if os.path.exists(file_path):
            # Agregar timestamp para evitar cache del navegador
            timestamp = int(os.path.getmtime(file_path))
            return f"/media/hero/{filename}?v={timestamp}"
    return default_url

def home(request):
    emprendedoras = Emprendedora.objects.all()
    
    zonas_list = []
    for zona in Zona.objects.all():
        count = Emprendedora.objects.filter(territorio=zona.nombre).count()
        zonas_list.append({
            'nombre': zona.nombre,
            'cantidad_emprendedoras': count,
            'descripcion': zona.descripcion or ''
        })
        
    noticias = Noticia.objects.all().order_by('-fecha_publicacion')[:3]
    
    # Obtener imágenes del Hero
    hero_images = {
        'blob': get_custom_hero_image('blob', 'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?q=80&w=600&h=600&fit=crop'),
        'pottery': get_custom_hero_image('circle_pottery', 'https://images.unsplash.com/photo-1612196808214-b8e1d6145a8c?q=80&w=300&h=300&fit=crop'),
        'macrame': get_custom_hero_image('circle_macrame', 'https://images.unsplash.com/photo-1528826722302-d3743a9d55ea?q=80&w=300&h=300&fit=crop')
    }
    
    return render(request, 'index.html', {
        'emprendedoras': emprendedoras, 
        'zonas_list': zonas_list,
        'noticias': noticias,
        'hero_images': hero_images
    })

def todas_noticias(request):
    noticias = Noticia.objects.all().order_by('-fecha_publicacion')
    emprendedoras = Emprendedora.objects.all()
    return render(request, 'todas_noticias.html', {
        'noticias': noticias,
        'emprendedoras': emprendedoras
    })

def detalle_noticia(request, noticia_id):
    noticia = get_object_or_404(Noticia, id=noticia_id)
    emprendedoras = Emprendedora.objects.all()
    otras_noticias = Noticia.objects.exclude(id=noticia.id).order_by('-fecha_publicacion')[:3]
    return render(request, 'detalle_noticia.html', {
        'noticia': noticia,
        'emprendedoras': emprendedoras,
        'otras_noticias': otras_noticias
    })

def perfil_emprendedora(request, emprendedora_id):
    emprendedora = get_object_or_404(Emprendedora, id=emprendedora_id)
    emprendedoras = Emprendedora.objects.all()
    return render(request, 'perfil_emprendedora.html', {'emprendedora': emprendedora, 'emprendedoras': emprendedoras})

def login_admin(request):
    if request.user.is_authenticated:
        return redirect('panel_admin')
    
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        
        if user is not None:
            login(request, user)
            return redirect('panel_admin')
        else:
            messages.error(request, 'Usuario o contraseña incorrectos.')
    
    return render(request, 'login_admin.html')

def logout_admin(request):
    logout(request)
    return redirect('home')

@login_required(login_url='login_admin')
def panel_admin(request):
    total_emprendedoras = Emprendedora.objects.count()
    total_productos = Producto.objects.count()
    total_zonas = Zona.objects.count()
    total_noticias = Noticia.objects.count()
    
    # Recent activity
    recent_emprendedoras = Emprendedora.objects.all().order_by('-fecha_registro')[:5]
    recent_productos = Producto.objects.all().order_by('-id')[:5]
    recent_noticias = Noticia.objects.all().order_by('-fecha_publicacion')[:5]
    
    # Distribution by territory
    comunas_dist = list(Emprendedora.objects.values('territorio').annotate(total=Count('id')).order_by('-total')[:5])
    
    # Calculate percentage for progress bars in CSS (e.g. total / max_total * 100)
    max_total = 1
    for c in comunas_dist:
        if c['total'] > max_total:
            max_total = c['total']
            
    for c in comunas_dist:
        c['porcentaje'] = int((c['total'] / max_total) * 100)
        
    context = {
        'total_emprendedoras': total_emprendedoras,
        'total_productos': total_productos,
        'total_zonas': total_zonas,
        'total_noticias': total_noticias,
        'recent_emprendedoras': recent_emprendedoras,
        'recent_productos': recent_productos,
        'recent_noticias': recent_noticias,
        'comunas_dist': comunas_dist
    }
    return render(request, 'panel_admin.html', context)

@login_required(login_url='login_admin')
def administrar_emprendedoras(request):
    if request.method == 'POST':
        nombre = request.POST.get('nombre')
        rubro = request.POST.get('rubro')
        territorio = request.POST.get('territorio')
        historia = request.POST.get('historia')
        imagen_perfil = request.FILES.get('imagen_perfil') # Se recibe el archivo

        # 1. Guardamos la Emprendedora
        nueva_emprendedora = Emprendedora(
            nombre=nombre,
            rubro=rubro,
            territorio=territorio,
            historia=historia,
            imagen_perfil=imagen_perfil
        )
        nueva_emprendedora.save()
        
        # 2. Guardamos los Productos (Pueden ser varios)
        try:
            total_productos = int(request.POST.get('total_productos', 1))
        except ValueError:
            total_productos = 1
            
        for i in range(1, total_productos + 1):
            prod_nombre = request.POST.get(f'prod_nombre_{i}')
            if prod_nombre:  # Solo guarda si escribiste un nombre válido
                Producto.objects.create(
                    emprendedora=nueva_emprendedora,
                    nombre=prod_nombre,
                    precio=clean_price(request.POST.get(f'prod_precio_{i}')),
                    descripcion=request.POST.get(f'prod_descripcion_{i}', ''),
                    imagen=request.FILES.get(f'prod_imagen_{i}')
                )

        # 3. Guardamos los Procesos (Pueden ser varios)
        try:
            total_procesos = int(request.POST.get('total_procesos', 1))
        except ValueError:
            total_procesos = 1
            
        for i in range(1, total_procesos + 1):
            proc_titulo = request.POST.get(f'proc_titulo_{i}')
            if proc_titulo:
                Proceso.objects.create(
                    emprendedora=nueva_emprendedora,
                    titulo=proc_titulo,
                    descripcion=request.POST.get(f'proc_descripcion_{i}', ''),
                    imagen=request.FILES.get(f'proc_imagen_{i}')
                )

        # Enviamos mensaje de éxito y recargamos la página
        messages.success(request, f'¡El perfil completo de {nombre} se creó exitosamente!')
        return redirect('administrar_emprendedoras')

    emprendedoras = Emprendedora.objects.all().order_by('-id')
    return render(request, 'administrar_emprendedoras.html', {'emprendedoras': emprendedoras})

@login_required(login_url='login_admin')
def editar_emprendedora(request, emprendedora_id):
    emprendedora = get_object_or_404(Emprendedora, id=emprendedora_id)
    
    if request.method == 'POST':
        nombre = request.POST.get('nombre')
        rubro = request.POST.get('rubro')
        territorio = request.POST.get('territorio')
        historia = request.POST.get('historia')
        imagen_perfil = request.FILES.get('imagen_perfil')
        
        # 1. Actualizar datos de Emprendedora
        emprendedora.nombre = nombre
        emprendedora.rubro = rubro
        emprendedora.territorio = territorio
        emprendedora.historia = historia
        if imagen_perfil:
            emprendedora.imagen_perfil = imagen_perfil
        emprendedora.save()
        
        # 2. Procesar Productos Eliminados
        deleted_prod_ids = request.POST.get('deleted_productos', '').split(',')
        for p_id in deleted_prod_ids:
            if p_id.strip():
                Producto.objects.filter(id=p_id, emprendedora=emprendedora).delete()
                
        # 3. Guardar/Actualizar Productos
        try:
            total_productos = int(request.POST.get('total_productos', 1))
        except ValueError:
            total_productos = 1
            
        for i in range(1, total_productos + 1):
            prod_nombre = request.POST.get(f'prod_nombre_{i}')
            if prod_nombre:
                prod_id = request.POST.get(f'prod_id_{i}')
                prod_precio = clean_price(request.POST.get(f'prod_precio_{i}'))
                prod_descripcion = request.POST.get(f'prod_descripcion_{i}', '')
                prod_imagen = request.FILES.get(f'prod_imagen_{i}')
                
                if prod_id:  # Actualizar producto existente
                    producto = Producto.objects.filter(id=prod_id, emprendedora=emprendedora).first()
                    if producto:
                        producto.nombre = prod_nombre
                        producto.precio = prod_precio
                        producto.descripcion = prod_descripcion
                        if prod_imagen:
                            producto.imagen = prod_imagen
                        producto.save()
                else:  # Crear nuevo producto
                    Producto.objects.create(
                        emprendedora=emprendedora,
                        nombre=prod_nombre,
                        precio=prod_precio,
                        descripcion=prod_descripcion,
                        imagen=prod_imagen
                    )
                    
        # 4. Procesar Procesos Eliminados
        deleted_proc_ids = request.POST.get('deleted_procesos', '').split(',')
        for p_id in deleted_proc_ids:
            if p_id.strip():
                Proceso.objects.filter(id=p_id, emprendedora=emprendedora).delete()
                
        # 5. Guardar/Actualizar Procesos
        try:
            total_procesos = int(request.POST.get('total_procesos', 1))
        except ValueError:
            total_procesos = 1
            
        for i in range(1, total_procesos + 1):
            proc_titulo = request.POST.get(f'proc_titulo_{i}')
            if proc_titulo:
                proc_id = request.POST.get(f'proc_id_{i}')
                proc_descripcion = request.POST.get(f'proc_descripcion_{i}', '')
                proc_imagen = request.FILES.get(f'proc_imagen_{i}')
                
                if proc_id:  # Actualizar proceso existente
                    proceso = Proceso.objects.filter(id=proc_id, emprendedora=emprendedora).first()
                    if proceso:
                        proceso.titulo = proc_titulo
                        proceso.descripcion = proc_descripcion
                        if proc_imagen:
                            proceso.imagen = proc_imagen
                        proceso.save()
                else:  # Crear nuevo proceso
                    Proceso.objects.create(
                        emprendedora=emprendedora,
                        titulo=proc_titulo,
                        descripcion=proc_descripcion,
                        imagen=proc_imagen
                    )
                    
        messages.success(request, f'¡El perfil de {nombre} se actualizó exitosamente!')
        return redirect('administrar_emprendedoras')
        
    emprendedoras = Emprendedora.objects.all().order_by('-id')
    return render(request, 'administrar_emprendedoras.html', {
        'emprendedora': sorted([emprendedora], key=lambda x: x.id)[0], # Trick to bypass get
        'emprendedoras': emprendedoras,
        'is_edit': True
    })



@login_required(login_url='login_admin')
def agregar_producto(request):
    if request.method == 'POST':
        messages.success(request, '¡Producto configurado exitosamente! (Nota: Recuerda conectar esto a la base de datos).')
        return redirect('agregar_producto')
    emprendedoras = Emprendedora.objects.all()
    return render(request, 'agregar_producto.html', {'emprendedoras': emprendedoras})

@login_required(login_url='login_admin')
def agregar_proceso(request):
    if request.method == 'POST':
        messages.success(request, '¡Proceso configurado exitosamente! (Nota: Recuerda conectar esto a la base de datos).')
        return redirect('agregar_proceso')
    emprendedoras = Emprendedora.objects.all()
    return render(request, 'agregar_proceso.html', {'emprendedoras': emprendedoras})

@login_required(login_url='login_admin')
def agregar_noticia(request):
    if request.method == 'POST':
        titulo = request.POST.get('titulo')
        contenido = request.POST.get('contenido')
        imagen = request.FILES.get('imagen')
        
        if titulo and contenido:
            Noticia.objects.create(
                titulo=titulo,
                contenido=contenido,
                imagen=imagen
            )
            messages.success(request, '¡La noticia se ha creado exitosamente!')
        else:
            messages.error(request, 'Por favor completa los campos requeridos.')
        return redirect('agregar_noticia')
        
    noticias = Noticia.objects.all().order_by('-fecha_publicacion')
    return render(request, 'agregar_noticia.html', {'noticias': noticias})

@login_required(login_url='login_admin')
def eliminar_noticia(request, noticia_id):
    noticia = get_object_or_404(Noticia, id=noticia_id)
    titulo = noticia.titulo
    noticia.delete()
    messages.success(request, f'¡La noticia "{titulo}" se ha eliminado exitosamente!')
    return redirect('agregar_noticia')

@login_required(login_url='login_admin')
def editar_noticia(request, noticia_id):
    noticia = get_object_or_404(Noticia, id=noticia_id)
    if request.method == 'POST':
        titulo = request.POST.get('titulo')
        contenido = request.POST.get('contenido')
        imagen = request.FILES.get('imagen')
        
        if titulo and contenido:
            noticia.titulo = titulo
            noticia.contenido = contenido
            if imagen:
                noticia.imagen = imagen
            noticia.save()
            messages.success(request, f'¡La noticia "{titulo}" se ha actualizado exitosamente!')
            return redirect('agregar_noticia')
        else:
            messages.error(request, 'Por favor completa los campos requeridos.')
            
    return render(request, 'editar_noticia.html', {'noticia': noticia})

def vitrina_productos(request):
    productos = Producto.objects.select_related('emprendedora').all()
    emprendedoras = Emprendedora.objects.all()
    
    # Obtener categorías (rubros) únicas ordenadas
    rubros_set = set()
    for emp in emprendedoras:
        if emp.rubro:
            rubros_set.add(emp.rubro.strip())
            
    categorias = sorted(list(rubros_set))
    
    return render(request, 'vitrina.html', {
        'productos': productos,
        'categorias': categorias,
        'emprendedoras': emprendedoras
    })

def todas_emprendedoras(request):
    emprendedoras = Emprendedora.objects.all()
    # Obtener comunas/territorios para los filtros opcionales
    comunas_set = set()
    for emp in emprendedoras:
        if emp.territorio:
            comunas_set.add(emp.territorio.strip())
    comunas = sorted(list(comunas_set))
    
    return render(request, 'todas_emprendedoras.html', {
        'emprendedoras': emprendedoras,
        'comunas': comunas
    })

@login_required(login_url='login_admin')
def personalizar_hero(request):
    from django.core.files.storage import FileSystemStorage
    hero_dir = os.path.join(settings.MEDIA_ROOT, 'hero')
    os.makedirs(hero_dir, exist_ok=True)
    
    if request.method == 'POST':
        fs = FileSystemStorage(location=hero_dir)
        
        # Procesar los 3 archivos
        files_keys = {
            'blob_image': 'blob',
            'circle_pottery': 'circle_pottery',
            'circle_macrame': 'circle_macrame'
        }
        
        updated = False
        for field_name, file_key in files_keys.items():
            uploaded_file = request.FILES.get(field_name)
            if uploaded_file:
                # Eliminar cualquier archivo previo con el mismo prefijo (cualquier extensión)
                for ext in ['.png', '.jpg', '.jpeg', '.webp']:
                    old_path = os.path.join(hero_dir, f"{file_key}{ext}")
                    if os.path.exists(old_path):
                        try:
                            os.remove(old_path)
                        except OSError:
                            pass
                
                # Guardar el nuevo archivo con su extensión original
                ext = os.path.splitext(uploaded_file.name)[1].lower()
                if ext not in ['.png', '.jpg', '.jpeg', '.webp']:
                    ext = '.png' # Fallback
                    
                fs.save(f"{file_key}{ext}", uploaded_file)
                updated = True
                
        if updated:
            messages.success(request, '¡Las imágenes del banner de Inicio se actualizaron exitosamente!')
        else:
            messages.info(request, 'No se seleccionó ninguna imagen nueva.')
            
        return redirect('personalizar_hero')
        
    # Obtener URLs actuales o las de Unsplash por defecto
    current_images = {
        'blob': get_custom_hero_image('blob', 'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?q=80&w=600&h=600&fit=crop'),
        'pottery': get_custom_hero_image('circle_pottery', 'https://images.unsplash.com/photo-1612196808214-b8e1d6145a8c?q=80&w=300&h=300&fit=crop'),
        'macrame': get_custom_hero_image('circle_macrame', 'https://images.unsplash.com/photo-1528826722302-d3743a9d55ea?q=80&w=300&h=300&fit=crop')
    }
    
    return render(request, 'personalizar_hero.html', {
        'current_images': current_images
    })



