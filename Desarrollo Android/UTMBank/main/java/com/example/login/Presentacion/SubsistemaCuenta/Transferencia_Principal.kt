package com.example.login.Presentacion.SubsistemaCuenta

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.login.Presentacion.SubsistemaUsusario.Inicio_DrawMenu
import com.example.login.R
import kotlinx.android.synthetic.main.activity_transferencia__principal.*

class Transferencia_Principal : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_transferencia__principal)

        Aceptar()
        Cancelar()
    }
    fun Aceptar(){
        var cuenta=0
        switch_cuenta.setOnCheckedChangeListener { buttonView, isChecked ->
            if (isChecked)
                cuenta=1
            else
                cuenta=0
        }
        btn_aceptar.setOnClickListener(){
            if(cuenta==1){
                val pantalla : Intent = Intent(applicationContext,
                    Transferencia_InData::class.java)
                startActivity(pantalla)
            }
            else {
                val pantalla: Intent =
                    Intent(applicationContext, Transferencia_Confirmacion::class.java)
                startActivity(pantalla)
            }
        }
    }
    fun Cancelar(){
        btn_cancelar.setOnClickListener(){
            val pantalla : Intent = Intent(applicationContext,
                Inicio_DrawMenu::class.java)
            startActivity(pantalla)
        }
    }
}
