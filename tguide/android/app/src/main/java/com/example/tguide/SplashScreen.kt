package com.example.tguide
import android.animation.ObjectAnimator
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.view.View
import android.view.animation.AlphaAnimation
import android.widget.ImageView
import android.widget.ProgressBar
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.example.tguide.MainActivity

class SplashScreen : AppCompatActivity() {
    var progressBar: ProgressBar? = null
    var image: ImageView? = null
    var textView: TextView? = null
    var value = 0
    override fun onCreate(savedInstanceState: Bundle?) {

        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_splash_screen)
        progressBar = findViewById(R.id.progressBarId)
        image = findViewById(R.id.imglogo)
        textView = findViewById(R.id.text1)
        ObjectAnimator.ofFloat(image, View.ALPHA, 0.2f, 1.0f).setDuration(2000).start();
        ObjectAnimator.ofFloat(textView, View.ALPHA, 0.2f, 1.0f).setDuration(2000).start();
        ObjectAnimator.ofFloat(progressBar, View.ALPHA, 0.2f, 1.0f).setDuration(2000).start();


        val thread = Thread {
            value = 0
            while (value <= 100) {

                try {

                    Thread.sleep(25)
                    progressBar?.setProgress(value)




                    //setText(textView, "$value%")
                } catch (e: InterruptedException) {
                    e.printStackTrace()
                }
                value++
            }

        }
        thread.start()
        val secondsDelayed = 3
        Handler(Looper.getMainLooper()).postDelayed({
            startActivity(Intent(this@SplashScreen, MainActivity::class.java))
            finish()

        }, (secondsDelayed * 1000).toLong())



    }







    private fun setText(text: TextView?, value: String) {
        runOnUiThread { text!!.text = value }
    }
}