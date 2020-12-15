package com.example.login.Presentacion.SubsistemaCuenta

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.login.Presentacion.SubsistemaUsusario.Inicio_DrawMenu
import com.example.login.R
import kotlinx.android.synthetic.main.activity_consulta_movimientos.*

class consulta_movimientos : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_consulta_movimientos)
        Atras()
    }
    fun Atras(){
        btn_atras.setOnClickListener(){
            val Main : Intent = Intent(applicationContext,
                Inicio_DrawMenu::class.java)
            startActivity(Main)
        }
    }
}
