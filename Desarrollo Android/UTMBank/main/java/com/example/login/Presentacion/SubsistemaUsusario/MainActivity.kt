package com.example.login.Presentacion.SubsistemaUsusario

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.login.R
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.ValueEventListener
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.activity_main.btn_Registro

var Nombre:String?=null
class MainActivity : AppCompatActivity() {

    companion object {
        var currentMatricula = ""
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        Registro()
        InicioSesion()

    }
    fun check() : Boolean{
        var bnd = false
        var matricula : String = txt_matricula.text.toString()
        var contraseña : String = editText4.text.toString()
        val getdata = object : ValueEventListener {
            override fun onCancelled(p0: DatabaseError) {
            }
            override fun onDataChange(p0: DataSnapshot) {
                currentMatricula = p0.child("users").child(matricula).child("matricula").value.toString()
                val password : String = p0.child("users").child(matricula).child("password").value.toString()
                bnd = matricula== currentMatricula && contraseña==password
            }
        }
        Registro.database.addListenerForSingleValueEvent(getdata)
        if (bnd) {
            Toast.makeText(this, "Bienvenido",Toast.LENGTH_LONG).show()
            return true
        }
        else{
            Toast.makeText(this, "Datos incorrectos",Toast.LENGTH_LONG).show()
            return false
        }
    }

    fun InicioSesion(){
        btn_inicioSesion.setOnClickListener(){
            if (check()){
                val Inicio_DrawMenu : Intent= Intent(applicationContext, Inicio_DrawMenu::class.java)
                startActivity(Inicio_DrawMenu)
            }
            else{
                val MainActivity : Intent = Intent(applicationContext, MainActivity()::class.java)
                startActivity((MainActivity))
            }
        }
    }
    fun Registro(){
        btn_Registro.setOnClickListener(){
            val Registro : Intent= Intent(applicationContext, Registro::class.java)
            startActivity(Registro)
        }
    }
}
