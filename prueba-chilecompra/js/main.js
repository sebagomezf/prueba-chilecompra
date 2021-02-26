const botonesListado = document.querySelectorAll('.categoria__item-boton');
const botonesCollapse = document.querySelectorAll('.btn-collapse');
const flechasCollapse = document.querySelectorAll('.flecha-collapse');

const selectClasificador = document.querySelector('#clasificador');
const categoriasClasificados = document.querySelectorAll('.categorias-clasificados');

function ocultarClasificados(){
    categoriasClasificados.forEach(function(categoria){
        categoria.classList.add('d-none');
    })
}

function buscarClasificados(){
    let valorClasificador = selectClasificador.value;
    let contenedorClasificador = document.getElementById(`${valorClasificador}`);

    switch (valorClasificador) {
        case "1":
        ocultarClasificados()
        contenedorClasificador.classList.remove('d-none')
        break;
        case "2":
        ocultarClasificados()
        contenedorClasificador.classList.remove('d-none')
        break;
        case "3":
        ocultarClasificados()
        contenedorClasificador.classList.remove('d-none')
        break;
        case "4":
        ocultarClasificados()
        contenedorClasificador.classList.remove('d-none')
        break;
        case "5":
        ocultarClasificados()
        contenedorClasificador.classList.remove('d-none')
        break;
    }

}

//Botones Agregar
botonesListado.forEach(function(boton){
    boton.addEventListener('click', function(){
        let contenedor = this.closest('.categoria__item');
        let icono = this.previousElementSibling;
        
        this.classList.toggle('boton-agregado')
        icono.classList.toggle('icono-visible')
        contenedor.classList.toggle('agregado');
        
        
        if (this.classList.contains('boton-agregado')){
            this.innerHTML = "Agregado";
        } else{
            this.innerHTML = `<span class="d-none d-md-inline">+</span> Agregar <span class="d-none d-md-inline">al Listado</span>`;
        }
    })
});





//Flechas Collapse
botonesCollapse.forEach(function(botonCollapse){
    
    botonCollapse.addEventListener('click', function(){
        
        flechasCollapse.forEach(function(cadaFlecha){
            cadaFlecha.classList.remove('rotado');
        })
        
        let flecha = this.querySelector('.flecha-collapse');
        let div = this.closest('div');
        let collapse = div.nextElementSibling;
        
        if(!collapse.classList.contains('show')){
            flecha.classList.add('rotado') 
        } else{
            flecha.classList.remove('rotado') 
        }
        
    })
    
});