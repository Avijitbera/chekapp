package xyz.bytecop.appinsights
import io.flutter.plugin.common.MethodChannel
import android.content.BroadcastReceiver
import android.content.Intent
import android.content.IntentFilter
import android.os.Bundle
import android.os.PersistableBundle
import android.widget.Toast
import androidx.core.content.ContextCompat

import com.example.checkapp.service.DetectInstall
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    private val CHANNEL = "app_service"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            // This method is invoked on the main thread.
            // TODO
            if(call.method == "start_service"){
                Toast.makeText(this, "From Create", Toast.LENGTH_SHORT).show()
                val br: BroadcastReceiver = DetectInstall()
                val filter = IntentFilter(Intent.ACTION_PACKAGE_ADDED)
                filter.addAction(Intent.ACTION_PACKAGE_CHANGED)
                filter.addAction(Intent.ACTION_PACKAGE_INSTALL)
                filter.addAction(Intent.ACTION_PACKAGE_REPLACED)

                val listenToBroadcastsFromOtherApps = false
                val receiverFlags = if (listenToBroadcastsFromOtherApps) {
                    ContextCompat.RECEIVER_EXPORTED
                } else {
                    ContextCompat.RECEIVER_NOT_EXPORTED
                }
                ContextCompat.registerReceiver(context, br, filter, receiverFlags)
//                startService(filter.)
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)

    }
}
