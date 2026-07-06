from django.db import models

# Create your models here.
class Producto(models.Model):
    emprendedora = models.ForeignKey('Emprendedora', on_delete=models.CASCADE, related_name='productos', null=True, blank=True)
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    imagen = models.ImageField(upload_to='productos/') 

    def __str__(self):
        return self.nombre

class Emprendedora(models.Model):
    nombre = models.CharField(max_length=150)
    rubro = models.CharField(max_length=100) # Ej: Artesanía, Orfebrería
    territorio = models.CharField(max_length=100) # Ej: Concepción, Talcahuano
    historia = models.TextField(help_text="Breve historia o descripción de la emprendedora")
    imagen_perfil = models.ImageField(upload_to='emprendedoras/', null=True, blank=True)
    fecha_registro = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.nombre

class Proceso(models.Model):
    emprendedora = models.ForeignKey(Emprendedora, on_delete=models.CASCADE, related_name='procesos')
    titulo = models.CharField(max_length=150)
    descripcion = models.TextField()
    imagen = models.ImageField(upload_to='procesos/', null=True, blank=True)

    def __str__(self):
        return f"{self.titulo} - {self.emprendedora.nombre}"

class Zona(models.Model):
    nombre = models.CharField(max_length=100, unique=True)
    cantidad_emprendedoras = models.IntegerField(default=0)
    descripcion = models.TextField(blank=True, null=True, help_text="Descripción o detalles del territorio")

    def __str__(self):
        return self.nombre

class Noticia(models.Model):
    titulo = models.CharField(max_length=200, verbose_name="Título")
    contenido = models.TextField(verbose_name="Contenido")
    imagen = models.ImageField(upload_to='noticias/', null=True, blank=True, verbose_name="Imagen descriptiva")
    fecha_publicacion = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de publicación")

    def __str__(self):
        return self.titulo

