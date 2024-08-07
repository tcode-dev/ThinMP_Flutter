// Autogenerated from Pigeon (v16.0.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon


import android.util.Log
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMessageCodec
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer

private fun wrapResult(result: Any?): List<Any?> {
  return listOf(result)
}

private fun wrapError(exception: Throwable): List<Any?> {
  if (exception is FlutterError) {
    return listOf(
      exception.code,
      exception.message,
      exception.details
    )
  } else {
    return listOf(
      exception.javaClass.simpleName,
      exception.toString(),
      "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
    )
  }
}

private fun createConnectionError(channelName: String): FlutterError {
  return FlutterError("channel-error",  "Unable to establish connection on channel: '$channelName'.", "")}

/**
 * Error class for passing custom error details to Flutter via a thrown PlatformException.
 * @property code The error code.
 * @property message The error message.
 * @property details The error details. Must be a datatype supported by the api codec.
 */
class FlutterError (
  val code: String,
  override val message: String? = null,
  val details: Any? = null
) : Throwable()

/** Generated class from Pigeon that represents data sent in messages. */
data class Song (
  val id: String,
  val title: String,
  val artist: String,
  val imageId: String,
  val duration: Double

) {
  companion object {
    @Suppress("UNCHECKED_CAST")
    fun fromList(list: List<Any?>): Song {
      val id = list[0] as String
      val title = list[1] as String
      val artist = list[2] as String
      val imageId = list[3] as String
      val duration = list[4] as Double
      return Song(id, title, artist, imageId, duration)
    }
  }
  fun toList(): List<Any?> {
    return listOf<Any?>(
      id,
      title,
      artist,
      imageId,
      duration,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class Album (
  val id: String,
  val title: String,
  val artist: String,
  val imageId: String

) {
  companion object {
    @Suppress("UNCHECKED_CAST")
    fun fromList(list: List<Any?>): Album {
      val id = list[0] as String
      val title = list[1] as String
      val artist = list[2] as String
      val imageId = list[3] as String
      return Album(id, title, artist, imageId)
    }
  }
  fun toList(): List<Any?> {
    return listOf<Any?>(
      id,
      title,
      artist,
      imageId,
    )
  }
}

@Suppress("UNCHECKED_CAST")
private object AlbumHostApiCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      128.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          Album.fromList(it)
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is Album -> {
        stream.write(128)
        writeValue(stream, value.toList())
      }
      else -> super.writeValue(stream, value)
    }
  }
}

/**
 * HostApi
 *
 * Generated interface from Pigeon that represents a handler of messages from Flutter.
 */
interface AlbumHostApi {
  fun getAllAlbums(): List<Album>

  companion object {
    /** The codec used by AlbumHostApi. */
    val codec: MessageCodec<Any?> by lazy {
      AlbumHostApiCodec
    }
    /** Sets up an instance of `AlbumHostApi` to handle messages through the `binaryMessenger`. */
    @Suppress("UNCHECKED_CAST")
    fun setUp(binaryMessenger: BinaryMessenger, api: AlbumHostApi?) {
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.AlbumHostApi.getAllAlbums", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            var wrapped: List<Any?>
            try {
              wrapped = listOf<Any?>(api.getAllAlbums())
            } catch (exception: Throwable) {
              wrapped = wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}
/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface ArtworkHostApi {
  fun queryArtwork(id: String, callback: (Result<ByteArray?>) -> Unit)

  companion object {
    /** The codec used by ArtworkHostApi. */
    val codec: MessageCodec<Any?> by lazy {
      StandardMessageCodec()
    }
    /** Sets up an instance of `ArtworkHostApi` to handle messages through the `binaryMessenger`. */
    @Suppress("UNCHECKED_CAST")
    fun setUp(binaryMessenger: BinaryMessenger, api: ArtworkHostApi?) {
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.ArtworkHostApi.queryArtwork", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val idArg = args[0] as String
            api.queryArtwork(idArg) { result: Result<ByteArray?> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                val data = result.getOrNull()
                reply.reply(wrapResult(data))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}
/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface PlayerHostApi {
  fun startAllSongs(index: Long)
  fun play()
  fun pause()
  fun prev()
  fun next()
  fun seek(time: Double)
  fun getCurrentTime(): Double

  companion object {
    /** The codec used by PlayerHostApi. */
    val codec: MessageCodec<Any?> by lazy {
      StandardMessageCodec()
    }
    /** Sets up an instance of `PlayerHostApi` to handle messages through the `binaryMessenger`. */
    @Suppress("UNCHECKED_CAST")
    fun setUp(binaryMessenger: BinaryMessenger, api: PlayerHostApi?) {
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.startAllSongs", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val indexArg = args[0].let { if (it is Int) it.toLong() else it as Long }
            var wrapped: List<Any?>
            try {
              api.startAllSongs(indexArg)
              wrapped = listOf<Any?>(null)
            } catch (exception: Throwable) {
              wrapped = wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.play", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            var wrapped: List<Any?>
            try {
              api.play()
              wrapped = listOf<Any?>(null)
            } catch (exception: Throwable) {
              wrapped = wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.pause", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            var wrapped: List<Any?>
            try {
              api.pause()
              wrapped = listOf<Any?>(null)
            } catch (exception: Throwable) {
              wrapped = wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.prev", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            var wrapped: List<Any?>
            try {
              api.prev()
              wrapped = listOf<Any?>(null)
            } catch (exception: Throwable) {
              wrapped = wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.next", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            var wrapped: List<Any?>
            try {
              api.next()
              wrapped = listOf<Any?>(null)
            } catch (exception: Throwable) {
              wrapped = wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.seek", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val timeArg = args[0] as Double
            var wrapped: List<Any?>
            try {
              api.seek(timeArg)
              wrapped = listOf<Any?>(null)
            } catch (exception: Throwable) {
              wrapped = wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.getCurrentTime", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            var wrapped: List<Any?>
            try {
              wrapped = listOf<Any?>(api.getCurrentTime())
            } catch (exception: Throwable) {
              wrapped = wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}
@Suppress("UNCHECKED_CAST")
private object SongHostApiCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      128.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          Song.fromList(it)
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is Song -> {
        stream.write(128)
        writeValue(stream, value.toList())
      }
      else -> super.writeValue(stream, value)
    }
  }
}

/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface SongHostApi {
  fun getAllSongs(): List<Song>

  companion object {
    /** The codec used by SongHostApi. */
    val codec: MessageCodec<Any?> by lazy {
      SongHostApiCodec
    }
    /** Sets up an instance of `SongHostApi` to handle messages through the `binaryMessenger`. */
    @Suppress("UNCHECKED_CAST")
    fun setUp(binaryMessenger: BinaryMessenger, api: SongHostApi?) {
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.SongHostApi.getAllSongs", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            var wrapped: List<Any?>
            try {
              wrapped = listOf<Any?>(api.getAllSongs())
            } catch (exception: Throwable) {
              wrapped = wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}
@Suppress("UNCHECKED_CAST")
private object PlayerFlutterApiCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      128.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          Song.fromList(it)
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is Song -> {
        stream.write(128)
        writeValue(stream, value.toList())
      }
      else -> super.writeValue(stream, value)
    }
  }
}

/**
 * FlutterApi
 *
 * Generated class from Pigeon that represents Flutter messages that can be called from Kotlin.
 */
@Suppress("UNCHECKED_CAST")
class PlayerFlutterApi(private val binaryMessenger: BinaryMessenger) {
  companion object {
    /** The codec used by PlayerFlutterApi. */
    val codec: MessageCodec<Any?> by lazy {
      PlayerFlutterApiCodec
    }
  }
  fun onIsPlayingChange(isPlayingArg: Boolean, callback: (Result<Unit>) -> Unit)
{
    val channelName = "dev.flutter.pigeon.thinmpf.PlayerFlutterApi.onIsPlayingChange"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(listOf(isPlayingArg)) {
      if (it is List<*>) {
        if (it.size > 1) {
          callback(Result.failure(FlutterError(it[0] as String, it[1] as String, it[2] as String?)))
        } else {
          callback(Result.success(Unit))
        }
      } else {
        callback(Result.failure(createConnectionError(channelName)))
      } 
    }
  }
  fun onPlaybackSongChange(songArg: Song, callback: (Result<Unit>) -> Unit)
{
    val channelName = "dev.flutter.pigeon.thinmpf.PlayerFlutterApi.onPlaybackSongChange"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(listOf(songArg)) {
      if (it is List<*>) {
        if (it.size > 1) {
          callback(Result.failure(FlutterError(it[0] as String, it[1] as String, it[2] as String?)))
        } else {
          callback(Result.success(Unit))
        }
      } else {
        callback(Result.failure(createConnectionError(channelName)))
      } 
    }
  }
}
