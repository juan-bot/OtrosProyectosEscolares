package com.example.login.Presentacion

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.AdapterView
import android.widget.ArrayAdapter
import com.example.login.Presentacion.SubsistemaUsusario.Inicio_DrawMenu
import com.example.login.R
import kotlinx.android.synthetic.main.activity_pago__extraordinario.*

class Pago_Extraordinario : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_pago__extraordinario)
        var lista = arrayOf("3JDAAA-LICENCIATURA ESCOLARIZADA","3JDAAA-LICENCIATURA VIRTUAL","3JDAAA-POSTGRADO ESCOLARIZADO","3JDAAA-POSTGRADO VIRTUAL")
        var arrayAdapter = ArrayAdapter<String>(
            this,
            android.R.layout.simple_spinner_dropdown_item,
            android.R.id.text1,
            lista
        )
        spinner_service2.adapter = arrayAdapter
        spinner_service2.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
            override fun onItemSelected(
                parent: AdapterView<*>?,
                view: View?,
                position: Int,
                id: Long
            ) {
                //Toast.makeText(applicationContext, "${lista[position]}", Toast.LENGTH_SHORT).show()
                textView_clave2.setText("${lista[position]}-EXTRAORDINARIO")
            }

            override fun onNothingSelected(parent: AdapterView<*>?) {
                //
            }
        }
        Pagar()
    }
    fun Pagar(){
        btn_pagar_extraordinario.setOnClickListener(){
            val pantalla : Intent = Intent(applicationContext,
                Inicio_DrawMenu::class.java)
            startActivity(pantalla)
        }
    }
}