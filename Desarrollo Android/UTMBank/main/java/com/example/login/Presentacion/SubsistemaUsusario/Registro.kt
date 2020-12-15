package com.example.login.Presentacion.SubsistemaUsusario

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.login.Negocios.SubsistemaControlCuenta.usuario
import com.example.login.R.layout.activity_registro
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.FirebaseDatabase
import com.google.firebase.database.ValueEventListener
import kotlinx.android.synthetic.main.activity_main.btn_Registro
import kotlinx.android.synthetic.main.activity_registro.*

class Registro : AppCompatActivity() {

    companion object{
        var database = FirebaseDatabase.getInstance().reference
        var bnd = false
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(activity_registro)
        Aceptar()
        Cancelar()
    }
    fun Registro(): Boolean{
        val nombre: String = nNombre.text.toString()
        val matricula: String = editText5.text.toString()
        val pin: String = editText6.text.toString()
        val password: String = editText9.text.toString()

        if (nombre==null || nombre.trim()=="" || matricula==null || matricula.trim()=="" || pin==null || pin.trim()=="" || password==null || password.trim()==null) {
            Toast.makeText(this, "No puedes dejar campos vacios",Toast.LENGTH_LONG).show()
            return false
        }
        else {
            val getdata = object : ValueEventListener {
                override fun onCancelled(p0: DatabaseError) {
                }
                override fun onDataChange(p0: DataSnapshot) {
                    val data = p0.child("users").child(matricula).exists()
                    if (!data) {
                        database.child("users").child(matricula).setValue(
                            usuario(
                                nombre,
                                matricula.toInt(),
                                pin.toInt(),
                                password
                            )
                        )
                        bnd = true
                    }
                    else {
                        bnd = false
                    }
                }
            }
            database.addListenerForSingleValueEvent(getdata)
            if(bnd){
                Toast.makeText(this, "Registro exitoso, inicia sesion",Toast.LENGTH_LONG).show()
                return true
            }
            else{
                Toast.makeText(this, "La matricula ya esta registrada",Toast.LENGTH_LONG).show()
                return false
            }
        }
    }
    fun Cancelar(){
        btn_cancel.setOnClickListener(){
            val Main : Intent = Intent(applicationContext,
                MainActivity::class.java)
            startActivity(Main)
        }
    }
    fun Aceptar(){
        btn_Registro.setOnClickListener(){
            if(Registro()){
                val aux : Intent = Intent(applicationContext, MainActivity::class.java)
                startActivity(aux)
            }
            else{
                val aux : Intent = Intent(applicationContext,
                    Registro::class.java)
                startActivity(aux)
            }
        }
    }

}