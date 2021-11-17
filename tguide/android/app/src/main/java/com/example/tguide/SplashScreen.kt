package com.example.tguide

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.widget.ProgressBar;
import android.widget.TextView;

class SplashScreen : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_splash_screen)
        progressBar = findViewById(R.id.progressBarId);
        textView = findViewById(R.id.textViewId);

        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                for (value = 0; value<=100; value++){
                try {
                    Thread.sleep(30);
                    progressBar.setProgress(value);
                    setText(textView, String.valueOf(value)+"%" );

                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            }
        });

        thread.start();

        int secondsDelayed = 3;
        new Handler().postDelayed(new Runnable() {
            public void run() {
                startActivity(new Intent(SplashScreen.this,   MainActivity.class));
                finish();
            }
        }, secondsDelayed * 1000);

    }

    private void setText(final TextView text,final String value){
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                text.setText(value);
            }
        });
    }

}