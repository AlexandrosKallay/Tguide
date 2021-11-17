package com.example.tguide
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.widget.ProgressBar
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.example.tguide.MainActivity

class SplashScreen : AppCompatActivity() {
    var progressBar: ProgressBar? = null
    //var textView: TextView? = null
    var value = 0
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_splash_screen)
        progressBar = findViewById(R.id.progressBarId)
        //textView = findViewById(R.id.text1)
        val thread = Thread {
            value = 0
            while (value <= 100) {
                try {
                    Thread.sleep(30)
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
        Handler().postDelayed({
            startActivity(Intent(this@SplashScreen, MainActivity::class.java))
            finish()
        }, (secondsDelayed * 1000).toLong())
    }

    private fun setText(text: TextView?, value: String) {
        runOnUiThread { text!!.text = value }
    }
}