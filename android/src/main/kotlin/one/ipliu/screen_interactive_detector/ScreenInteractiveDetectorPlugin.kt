package one.ipliu.screen_interactive_detector

import android.app.KeyguardManager
import android.content.Context
import android.os.PowerManager
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** ScreenInteractiveDetectorPlugin */
class ScreenInteractiveDetectorPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var bindingContext : Context? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    bindingContext = flutterPluginBinding.applicationContext
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "screen_interactive_detector")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (bindingContext == null)
      return result.error("NullContext",
        "Cannot access system service as context is null", null)

    if (call.method == "isInteractive") {
      result.success(isInteractive(bindingContext!!))
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun isInteractive(@NonNull context: Context): Boolean {
    val keyguardManager: KeyguardManager =
      context.getSystemService(Context.KEYGUARD_SERVICE) as KeyguardManager
    if (keyguardManager.isKeyguardLocked)
      return false

    val powerManager: PowerManager = context.getSystemService(Context.POWER_SERVICE) as PowerManager
    return powerManager.isInteractive
  }
}
