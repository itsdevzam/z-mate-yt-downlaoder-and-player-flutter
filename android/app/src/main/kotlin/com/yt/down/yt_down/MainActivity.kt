package com.yt.down.yt_down

//import android.content.Intent
//import android.net.Uri
//import android.os.Build
//import android.os.Environment
//
//import com.chaquo.python.Python
//import com.chaquo.python.android.AndroidPlatform

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

import java.io.File

class MainActivity : FlutterActivity() {
///Unused we use mux only
//    private val CHANNEL =
//        "com.yt.down/downloader"
//
//    override fun configureFlutterEngine(
//        flutterEngine: FlutterEngine
//    ) {
//
//        super.configureFlutterEngine(flutterEngine)
//
//        // =====================================================
//        // START PYTHON
//        // =====================================================
//
//        if (!Python.isStarted()) {
//            Python.start(AndroidPlatform(this))
//        }
//
//        val python = Python.getInstance()
//
//        val downloader =
//            python.getModule("downloader")
//
//
//        // =====================================================
//        // METHOD CHANNEL
//        // =====================================================
//
//        MethodChannel(
//            flutterEngine.dartExecutor.binaryMessenger,
//            CHANNEL
//        ).setMethodCallHandler { call, result ->
//
//            when (call.method) {
//
//                // =================================================
//                // CHECK / REQUEST STORAGE
//                // =================================================
//
//                "ensureStorageAccess" -> {
//
//                    try {
//
//                        if (hasStorageAccess()) {
//
//                            val directory =
//                                getYTDownloadDirectory()
//
//                            result.success(
//                                directory.absolutePath
//                            )
//
//                        } else {
//
//                            requestStorageAccess()
//
//                            result.success(null)
//                        }
//
//                    } catch (e: Exception) {
//
//                        e.printStackTrace()
//
//                        result.error(
//                            "STORAGE_ERROR",
//                            e.message,
//                            null
//                        )
//                    }
//                }
//
//
//                // =================================================
//                // CHECK ONLY
//                // =================================================
//
//                "hasStorageAccess" -> {
//
//                    result.success(
//                        hasStorageAccess()
//                    )
//                }
//
//
//                // =================================================
//                // GET DOWNLOAD DIRECTORY
//                // =================================================
//
//                "getDownloadDirectory" -> {
//
//                    try {
//
//                        if (!hasStorageAccess()) {
//
//                            result.error(
//                                "NO_STORAGE_PERMISSION",
//                                "Storage permission is not granted",
//                                null
//                            )
//
//                            return@setMethodCallHandler
//                        }
//
//                        val directory =
//                            getYTDownloadDirectory()
//
//                        result.success(
//                            directory.absolutePath
//                        )
//
//                    } catch (e: Exception) {
//
//                        e.printStackTrace()
//
//                        result.error(
//                            "DIRECTORY_ERROR",
//                            e.message,
//                            null
//                        )
//                    }
//                }
//
//
//                // =================================================
//                // AUDIO DOWNLOAD
//                // =================================================
//
//                "downloadAudio" -> {
//
//                    val videoId =
//                        call.argument<String>("videoId")
//
//                    val audioTag =
//                        call.argument<String>("audioTag")
//
//                    if (videoId == null ||
//                        audioTag == null
//                    ) {
//
//                        result.error(
//                            "INVALID_ARGUMENTS",
//                            "videoId or audioTag is missing",
//                            null
//                        )
//
//                        return@setMethodCallHandler
//                    }
//
//
//                    // IMPORTANT:
//                    // Check storage AGAIN before download.
//
//                    if (!hasStorageAccess()) {
//
//                        requestStorageAccess()
//
//                        result.error(
//                            "NO_STORAGE_PERMISSION",
//                            "Storage permission is required",
//                            null
//                        )
//
//                        return@setMethodCallHandler
//                    }
//
//
//                    val downloadDir =
//                        getYTDownloadDirectory()
//
//
//                    Thread {
//
//                        try {
//
//                            println(
//                                "Starting Python audio download..."
//                            )
//
//                            println(
//                                "Video ID: $videoId"
//                            )
//
//                            println(
//                                "Audio Tag: $audioTag"
//                            )
//
//                            println(
//                                "Directory: ${downloadDir.absolutePath}"
//                            )
//
//
//                            val response =
//                                downloader.callAttr(
//                                    "download_audio",
//                                    videoId,
//                                    audioTag,
//                                    downloadDir.absolutePath
//                                )
//
//
//                            println(
//                                "Python returned: $response"
//                            )
//
//
//                            runOnUiThread {
//
//                                result.success(
//                                    response.toString()
//                                )
//                            }
//
//                        } catch (e: Exception) {
//
//                            e.printStackTrace()
//
//                            runOnUiThread {
//
//                                result.error(
//                                    "DOWNLOAD_ERROR",
//                                    e.message,
//                                    null
//                                )
//                            }
//                        }
//
//                    }.start()
//                }
//
//
//                // =================================================
//                // VIDEO DOWNLOAD
//                // =================================================
//
//                "downloadVideo" -> {
//
//                    val videoId =
//                        call.argument<String>("videoId")
//
//                    val videoTag =
//                        call.argument<String>("videoTag")
//
//                    if (videoId == null ||
//                        videoTag == null
//                    ) {
//
//                        result.error(
//                            "INVALID_ARGUMENTS",
//                            "videoId or videoTag is missing",
//                            null
//                        )
//
//                        return@setMethodCallHandler
//                    }
//
//
//                    if (!hasStorageAccess()) {
//
//                        requestStorageAccess()
//
//                        result.error(
//                            "NO_STORAGE_PERMISSION",
//                            "Storage permission is required",
//                            null
//                        )
//
//                        return@setMethodCallHandler
//                    }
//
//
//                    val downloadDir =
//                        getYTDownloadDirectory()
//
//
//                    Thread {
//
//                        try {
//
//                            println(
//                                "Starting Python video download..."
//                            )
//
//                            println(
//                                "Video ID: $videoId"
//                            )
//
//                            println(
//                                "Video Tag: $videoTag"
//                            )
//
//                            println(
//                                "Directory: ${downloadDir.absolutePath}"
//                            )
//
//
//                            val response =
//                                downloader.callAttr(
//                                    "download_video",
//                                    videoId,
//                                    videoTag,
//                                    downloadDir.absolutePath
//                                )
//
//
//                            println(
//                                "Python returned: $response"
//                            )
//
//
//                            runOnUiThread {
//
//                                result.success(
//                                    response.toString()
//                                )
//                            }
//
//                        } catch (e: Exception) {
//
//                            e.printStackTrace()
//
//                            runOnUiThread {
//
//                                result.error(
//                                    "DOWNLOAD_ERROR",
//                                    e.message,
//                                    null
//                                )
//                            }
//                        }
//
//                    }.start()
//                }
//
//
//                else -> {
//
//                    result.notImplemented()
//                }
//            }
//        }
//    }
//
//
//    // =========================================================
//    // STORAGE
//    // =========================================================
//
//    private fun hasStorageAccess(): Boolean {
//
//        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
//
//            Environment.isExternalStorageManager()
//
//        } else {
//
//            checkSelfPermission(
//                android.Manifest.permission.WRITE_EXTERNAL_STORAGE
//            ) == android.content.pm.PackageManager.PERMISSION_GRANTED
//        }
//    }
//
//
//    private fun requestStorageAccess() {
//
//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
//
//            try {
//
//                val intent = Intent(
//                    android.provider.Settings
//                        .ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION
//                )
//
//                intent.data = Uri.parse(
//                    "package:$packageName"
//                )
//
//                startActivity(intent)
//
//            } catch (e: Exception) {
//
//                e.printStackTrace()
//            }
//
//        } else {
//
//            requestPermissions(
//                arrayOf(
//                    android.Manifest.permission
//                        .WRITE_EXTERNAL_STORAGE
//                ),
//                1001
//            )
//        }
//    }
//
//
//    private fun getYTDownloadDirectory(): File {
//
//        val downloadsDirectory =
//            Environment.getExternalStoragePublicDirectory(
//                Environment.DIRECTORY_DOWNLOADS
//            )
//
//        val ytDirectory =
//            File(
//                downloadsDirectory,
//                "YT_Down"
//            )
//
//        if (!ytDirectory.exists()) {
//
//            ytDirectory.mkdirs()
//        }
//
//        println(
//            "🔥 YT_Down directory: ${ytDirectory.absolutePath}"
//        )
//
//        return ytDirectory
//    }
}