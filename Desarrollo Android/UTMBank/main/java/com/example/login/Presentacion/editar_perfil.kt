package com.example.login.Presentacion

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.login.Negocios.SubsistemaControlCuenta.usuario
import com.example.login.Presentacion.SubsistemaUsusario.Inicio_DrawMenu
import com.example.login.Presentacion.SubsistemaUsusario.MainActivity.Companion.currentMatricula
import com.example.login.Presentacion.SubsistemaUsusario.Registro
import com.example.login.R
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.ValueEventListener
import kotlinx.android.synthetic.main.activity_editar_perfil.*

class editar_perfil : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_editar_perfil)
        Cancelar()
        Aceptar()
    }
    fun check(): Boolean {
        var nNombre : String = nNombre.text.toString()
        var nPin : String = editText2.text.toString()
        var nPasword : String = txt_matricula.text.toString()
        if (nNombre==null || nNombre.trim()=="" || nPin==null || nPin.trim()=="" || nPasword==null || nPasword.trim()=="") {
            Toast.makeText(this, "No puedes dejar campos vacios", Toast.LENGTH_LONG).show()
            return false
        }
        else{
            val getdata = object : ValueEventListener {
                override fun onCancelled(p0: DatabaseError) {
                }
                override fun onDataChange(p0: DataSnapshot) {
                    Registro.database.child("users").child(currentMatricula).setValue(
                        usuario(
                            nNombre,
                            currentMatricula.toInt(),
                            nPin.toInt(),
                            nPasword
                        )
                    )
                }
            }
            Registro.database.addListenerForSingleValueEvent(getdata)
            return true
        }
    }

    fun Aceptar(){
        if (check()){
            Toast.makeText(this, "Cambios Realizados con exito",Toast.LENGTH_LONG).show()
            val inicio : Intent = Intent(applicationContext,
                Inicio_DrawMenu::class.java)
            startActivity(inicio)
        }
        else{
            val editar : Intent = Intent(applicationContext,
                editar_perfil::class.java)
            startActivity(editar)
        }
    }
    fun Cancelar(){
        btn_cancelar.setOnClickListener(){
            val Main : Intent = Intent(applicationContext,
                Inicio_DrawMenu::class.java)
            startActivity(Main)
        }
    }
}
