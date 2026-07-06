import json
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.db.models import Count
from .models import Emprendedora, Producto, Proceso, Zona

def home(request):
    emprendedoras = Emprendedora.objects.all()
    
    zonas_list = []
    for zona in Zona.objects.all():
        zonas_list.append({
            'nombre': zona.nombre,
            'cantidad_emprendedoras': zona.cantidad_emprendedoras,
            'descripcion': zona.descripcion or ''
        })
        
    return render(request, 'index.html', {'emprendedoras': emprendedoras, 'zonas_list': zonas_list})

def perfil_emprendedora(request, emprendedora_id):
    emprendedora = get_object_or_404(Emprendedora, id=emprendedora_id)
    return render(request, 'perfil_emprendedora.html', {'emprendedora': emprendedora})

def panel_admin(request):
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
                    precio=request.POST.get(f'prod_precio_{i}', 0) or 0,
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
        return redirect('panel_admin')

    return render(request, 'panel_admin.html')

def administrar_zonas(request):
    if request.method == 'POST':
        action = request.POST.get('action', 'save')
        nombre = request.POST.get('nombre')
        
        if action == 'delete':
            zona = Zona.objects.filter(nombre=nombre).first()
            if zona:
                zona.delete()
                messages.success(request, f'¡Zona "{nombre}" eliminada exitosamente!')
        else:
            descripcion = request.POST.get('descripcion', '')
            cantidad = request.POST.get('cantidad', '')
            
            zona, created = Zona.objects.get_or_create(nombre=nombre)
            zona.descripcion = descripcion
            if str(cantidad).isdigit():
                zona.cantidad_emprendedoras = int(cantidad)
            zona.save()
            messages.success(request, f'¡Zona "{nombre}" actualizada exitosamente!')
            
        return redirect('administrar_zonas')
        
    zonas = Zona.objects.all()
    return render(request, 'administrar_zonas.html', {'zonas': zonas})