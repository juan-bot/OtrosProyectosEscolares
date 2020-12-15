package com.example.login.Presentacion.SubsistemaUsusario

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.login.Presentacion.SubsistemaUsusario.MainActivity.Companion.currentMatricula
import com.example.login.R
import com.example.login.Presentacion.SubsistemaUsusario.Registro.Companion.database
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.ValueEventListener
import kotlinx.android.synthetic.main.activity_eliminar_perfil.*

class eliminar_perfil : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_eliminar_perfil)
        Cancelar()
        Continuar()
    }
    fun check() : Boolean {
        var bnd = false
        btn_continuar.setOnClickListener{
            val getdata = object : ValueEventListener {
                override fun onCancelled(p0: DatabaseError) {
                }
                override fun onDataChange(p0: DataSnapshot) {
                    val password : String = p0.child("users").child(currentMatricula).child("password").toString()
                    val data : String = pin_text.text.toString()
                    if (data==password){
                        database.child("users").child(currentMatricula).removeValue()
                        bnd=true
                    }
                }
            }
            database.addListenerForSingleValueEvent(getdata)
        }
        if (bnd){
            Toast.makeText(this, "Perfil eliminado exitosamente", Toast.LENGTH_LONG).show()
            return true
        }
        else{
            return false
        }
    }
    fun Continuar(){
        if (check()){
            val Main : Intent = Intent(applicationContext,
                Inicio_DrawMenu::class.java)
            startActivity(Main)
        }
        else{
            val eliminarPerfil : Intent = Intent(applicationContext,
                eliminar_perfil::class.java)
            startActivity(eliminarPerfil)
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
