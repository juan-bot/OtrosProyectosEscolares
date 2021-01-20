      var secuencia = document.getElementById("secuencia");
      var titulo = document.getElementById("titulo");
      var genero = document.getElementById("genero");
      var tipo = document.getElementById("tipo");
      var imagen = document.getElementById("imagenn");

      
      var codigoYoutube;
      document.getElementById("playing").onClick = function() {reproducir()};  
      function Informacion(imag,n,secue,tit,gene,tip,codigo){
        imagen.src="imagenes/"+imag;
        titulo.innerHTML=tit;
        genero.innerHTML=gene;
        tipo.innerHTML=tip;
        if(n==1){
            secuencia.innerHTML="Actualmente reproduciendo";
        }
        else{
            secuencia.innerHTML="Comienza "+secue;
        }
      }
      /// la pagina que abrira el video de youtube, sugiero que sea un numero
      function reproducir(r) {
        window.location.href = 'Reproductor'+r+".html";
        
      }