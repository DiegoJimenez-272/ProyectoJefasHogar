from django.contrib import admin
from django.urls import path
from App import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home, name='home'),
    path('emprendedora/<int:emprendedora_id>/', views.perfil_emprendedora, name='perfil_emprendedora'),
    path('login/', views.login_admin, name='login_admin'),
    path('logout/', views.logout_admin, name='logout_admin'),
    path('admin-panel/', views.panel_admin, name='panel_admin'),
    path('admin-panel/emprendedoras/', views.administrar_emprendedoras, name='administrar_emprendedoras'),
    path('admin-panel/emprendedoras/editar/<int:emprendedora_id>/', views.editar_emprendedora, name='editar_emprendedora'),
    path('admin-panel/agregar-producto/', views.agregar_producto, name='agregar_producto'),
    path('admin-panel/agregar-proceso/', views.agregar_proceso, name='agregar_proceso'),
    path('admin-panel/agregar-noticia/', views.agregar_noticia, name='agregar_noticia'),
    path('admin-panel/eliminar-noticia/<int:noticia_id>/', views.eliminar_noticia, name='eliminar_noticia'),
    path('admin-panel/editar-noticia/<int:noticia_id>/', views.editar_noticia, name='editar_noticia'),
    path('noticias/', views.todas_noticias, name='todas_noticias'),
    path('noticia/<int:noticia_id>/', views.detalle_noticia, name='detalle_noticia'),
    path('vitrina/', views.vitrina_productos, name='vitrina_productos'),
    path('emprendedoras/', views.todas_emprendedoras, name='todas_emprendedoras'),
    path('admin-panel/personalizar-hero/', views.personalizar_hero, name='personalizar_hero'),
]

# Servir archivos multimedia en modo DEBUG
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
