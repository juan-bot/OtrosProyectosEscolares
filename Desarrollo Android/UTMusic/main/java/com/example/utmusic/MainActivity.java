package com.example.utmusic;

import androidx.appcompat.app.AppCompatActivity;

import android.media.MediaPlayer;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {
    Button play_pause, btn_repetir;
    MediaPlayer mp;
    ImageView iv;
    int repetir=2, posicion=0;
    MediaPlayer vectormp[]= new MediaPlayer [3];
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        play_pause =(Button)findViewById(R.id.btn_play);
        btn_repetir =(Button)findViewById(R.id.btn_repetir);
        iv=(ImageView)findViewById(R.id.imageView);
        vectormp[0] =MediaPlayer.create(this, R.raw.y_volvere);
        vectormp[1] =MediaPlayer.create(this, R.raw.end_of_the_line);
        vectormp[2] =MediaPlayer.create(this, R.raw.murio_la_flor);


    }
    public void PlayPause(View view){
        if(vectormp[posicion].isPlaying()){
            vectormp[posicion].pause();
            play_pause.setBackgroundResource(R.drawable.reproducir);
        }else{
            vectormp[posicion].start();
            play_pause.setBackgroundResource(R.drawable.pausa);
        }
    }
    public void Repetir(View view){
        if(repetir==1){
            btn_repetir.setBackgroundResource(R.drawable.no_repetir);
            vectormp[posicion].setLooping(false);
            repetir=2;
        }else{
            btn_repetir.setBackgroundResource(R.drawable.repetir);
            vectormp[posicion].setLooping(true);
            repetir=1;
        }
    }
    public void Siguiente(View view){
        if(posicion < vectormp.length -1){
            if(vectormp[posicion].isPlaying()){
                vectormp[posicion].stop();

                posicion++;
                vectormp[posicion].start();
                if(posicion==0)
                    iv.setImageResource(R.drawable.portada1);
                else if(posicion==1)
                    iv.setImageResource(R.drawable.portada2);
                else if(posicion==2)
                    iv.setImageResource(R.drawable.portada3);

            }
            else{
                posicion++;
                if(posicion==0)
                    iv.setImageResource(R.drawable.portada1);
                else if(posicion==1)
                    iv.setImageResource(R.drawable.portada2);
                else if(posicion==2)
                    iv.setImageResource(R.drawable.portada3);
            }
        }else{
            vectormp[posicion].stop();
            vectormp[0] =MediaPlayer.create(this, R.raw.y_volvere);
            vectormp[1] =MediaPlayer.create(this, R.raw.end_of_the_line);
            vectormp[2] =MediaPlayer.create(this, R.raw.murio_la_flor);
            posicion=0;
            vectormp[posicion].start();
        }
    }
    public void Anterior (View view){
        if(posicion >= 1){
            if(vectormp[posicion].isPlaying()){
                vectormp[posicion].stop();
                vectormp[0] = MediaPlayer.create(this, R.raw.y_volvere);
                vectormp[1] = MediaPlayer.create(this, R.raw.end_of_the_line);
                vectormp[2] = MediaPlayer.create(this, R.raw.murio_la_flor);
                posicion--;
                vectormp[posicion].start();
                if(posicion==0)
                    iv.setImageResource(R.drawable.portada1);
                else if(posicion==1)
                    iv.setImageResource(R.drawable.portada2);
                else if(posicion==2)
                    iv.setImageResource(R.drawable.portada3);
            }else{
                posicion--;
                vectormp[posicion].start();
                if(posicion==0)
                    iv.setImageResource(R.drawable.portada1);
                else if(posicion==1)
                    iv.setImageResource(R.drawable.portada2);
                else if(posicion==2)
                    iv.setImageResource(R.drawable.portada3);
            }
        }
    }
}