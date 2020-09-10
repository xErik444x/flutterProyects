# myapp
> Para crear un materialize app, mateapp
> para crear un stless widget, stlw

## añadir assets
+ Crear una carpeta con el nombre assets
+ Añadir las imagenes
+ ir al archivo pubspec.yaml y buscar la linea:
> assets:
+ Descomentarla y agregar la direccion del asset en cuestion
<br>

        assets:
        - assets/img/pinguino.jpg
> Para mostrarlos :

        Image.asset("assets/img/pinguino1.jpg", fit: BoxFit.cover)

# ¿Cuando usar un statless y un statefull ?
> el stateless es para cuando no vamos a estar cambiando cosas dinamicamente (un texto o cosas del estilo)

> el statefull es para cuando vamos a hacer cambios en tiempo real, como una calculadora.


# Gestos

> El Inkwell() genera el efecto de touch mientras que el GestureDetector no lo hace.