// Autogenerated from Pigeon (v22.4.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
@file:Suppress("UNCHECKED_CAST", "ArrayInDataClass")

package dev.tcode.thinmpf.pigeon_output

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
  return if (exception is FlutterError) {
    listOf(
      exception.code,
      exception.message,
      exception.details
    )
  } else {
    listOf(
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

enum class RepeatMode(val raw: Int) {
  OFF(0),
  ONE(1),
  ALL(2);

  companion object {
    fun ofRaw(raw: Int): RepeatMode? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

enum class ShuffleMode(val raw: Int) {
  OFF(0),
  ON(1);

  companion object {
    fun ofRaw(raw: Int): ShuffleMode? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class SongDTO (
  val id: String,
  val name: String,
  val albumId: String,
  val albumName: String,
  val artistId: String,
  val artistName: String,
  val imageId: String,
  val duration: Double,
  val trackNumber: Double
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): SongDTO {
      val id = pigeonVar_list[0] as String
      val name = pigeonVar_list[1] as String
      val albumId = pigeonVar_list[2] as String
      val albumName = pigeonVar_list[3] as String
      val artistId = pigeonVar_list[4] as String
      val artistName = pigeonVar_list[5] as String
      val imageId = pigeonVar_list[6] as String
      val duration = pigeonVar_list[7] as Double
      val trackNumber = pigeonVar_list[8] as Double
      return SongDTO(id, name, albumId, albumName, artistId, artistName, imageId, duration, trackNumber)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      id,
      name,
      albumId,
      albumName,
      artistId,
      artistName,
      imageId,
      duration,
      trackNumber,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class AlbumDTO (
  val id: String,
  val name: String,
  val artistId: String,
  val artistName: String,
  val imageId: String
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): AlbumDTO {
      val id = pigeonVar_list[0] as String
      val name = pigeonVar_list[1] as String
      val artistId = pigeonVar_list[2] as String
      val artistName = pigeonVar_list[3] as String
      val imageId = pigeonVar_list[4] as String
      return AlbumDTO(id, name, artistId, artistName, imageId)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      id,
      name,
      artistId,
      artistName,
      imageId,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class ArtistDTO (
  val id: String,
  val name: String
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): ArtistDTO {
      val id = pigeonVar_list[0] as String
      val name = pigeonVar_list[1] as String
      return ArtistDTO(id, name)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      id,
      name,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class ArtistDetailDTO (
  val id: String,
  val name: String,
  val imageId: String
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): ArtistDetailDTO {
      val id = pigeonVar_list[0] as String
      val name = pigeonVar_list[1] as String
      val imageId = pigeonVar_list[2] as String
      return ArtistDetailDTO(id, name, imageId)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      id,
      name,
      imageId,
    )
  }
}
private open class AudioPigeonCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      129.toByte() -> {
        return (readValue(buffer) as Long?)?.let {
          RepeatMode.ofRaw(it.toInt())
        }
      }
      130.toByte() -> {
        return (readValue(buffer) as Long?)?.let {
          ShuffleMode.ofRaw(it.toInt())
        }
      }
      131.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          SongDTO.fromList(it)
        }
      }
      132.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          AlbumDTO.fromList(it)
        }
      }
      133.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          ArtistDTO.fromList(it)
        }
      }
      134.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          ArtistDetailDTO.fromList(it)
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is RepeatMode -> {
        stream.write(129)
        writeValue(stream, value.raw)
      }
      is ShuffleMode -> {
        stream.write(130)
        writeValue(stream, value.raw)
      }
      is SongDTO -> {
        stream.write(131)
        writeValue(stream, value.toList())
      }
      is AlbumDTO -> {
        stream.write(132)
        writeValue(stream, value.toList())
      }
      is ArtistDTO -> {
        stream.write(133)
        writeValue(stream, value.toList())
      }
      is ArtistDetailDTO -> {
        stream.write(134)
        writeValue(stream, value.toList())
      }
      else -> super.writeValue(stream, value)
    }
  }
}


/**
 *
 * HostApi
 *
 *
 * Generated interface from Pigeon that represents a handler of messages from Flutter.
 */
interface SongHostApi {
  fun getAllSongs(): List<SongDTO>
  fun getSongsByAlbumId(albumId: String): List<SongDTO>
  fun getSongsByArtistId(artistId: String): List<SongDTO>
  fun getSongsByIds(ids: List<String>): List<SongDTO>
  fun getSongById(id: String): SongDTO?

  companion object {
    /** The codec used by SongHostApi. */
    val codec: MessageCodec<Any?> by lazy {
      AudioPigeonCodec()
    }
    /** Sets up an instance of `SongHostApi` to handle messages through the `binaryMessenger`. */
    @JvmOverloads
    fun setUp(binaryMessenger: BinaryMessenger, api: SongHostApi?, messageChannelSuffix: String = "") {
      val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.SongHostApi.getAllSongs$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              listOf(api.getAllSongs())
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.SongHostApi.getSongsByAlbumId$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val albumIdArg = args[0] as String
            val wrapped: List<Any?> = try {
              listOf(api.getSongsByAlbumId(albumIdArg))
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.SongHostApi.getSongsByArtistId$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val artistIdArg = args[0] as String
            val wrapped: List<Any?> = try {
              listOf(api.getSongsByArtistId(artistIdArg))
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.SongHostApi.getSongsByIds$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val idsArg = args[0] as List<String>
            val wrapped: List<Any?> = try {
              listOf(api.getSongsByIds(idsArg))
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.SongHostApi.getSongById$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val idArg = args[0] as String
            val wrapped: List<Any?> = try {
              listOf(api.getSongById(idArg))
            } catch (exception: Throwable) {
              wrapError(exception)
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
interface AlbumHostApi {
  fun getAllAlbums(): List<AlbumDTO>
  fun getAlbumsByArtistId(artistId: String): List<AlbumDTO>
  fun getRecentAlbums(count: Long): List<AlbumDTO>
  fun getAlbumById(id: String): AlbumDTO?

  companion object {
    /** The codec used by AlbumHostApi. */
    val codec: MessageCodec<Any?> by lazy {
      AudioPigeonCodec()
    }
    /** Sets up an instance of `AlbumHostApi` to handle messages through the `binaryMessenger`. */
    @JvmOverloads
    fun setUp(binaryMessenger: BinaryMessenger, api: AlbumHostApi?, messageChannelSuffix: String = "") {
      val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.AlbumHostApi.getAllAlbums$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              listOf(api.getAllAlbums())
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.AlbumHostApi.getAlbumsByArtistId$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val artistIdArg = args[0] as String
            val wrapped: List<Any?> = try {
              listOf(api.getAlbumsByArtistId(artistIdArg))
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.AlbumHostApi.getRecentAlbums$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val countArg = args[0] as Long
            val wrapped: List<Any?> = try {
              listOf(api.getRecentAlbums(countArg))
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.AlbumHostApi.getAlbumById$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val idArg = args[0] as String
            val wrapped: List<Any?> = try {
              listOf(api.getAlbumById(idArg))
            } catch (exception: Throwable) {
              wrapError(exception)
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
interface ArtistHostApi {
  fun getAllArtists(): List<ArtistDTO>
  fun getArtistDetailById(id: String): ArtistDetailDTO?
  fun getArtistsByIds(ids: List<String>): List<ArtistDTO>

  companion object {
    /** The codec used by ArtistHostApi. */
    val codec: MessageCodec<Any?> by lazy {
      AudioPigeonCodec()
    }
    /** Sets up an instance of `ArtistHostApi` to handle messages through the `binaryMessenger`. */
    @JvmOverloads
    fun setUp(binaryMessenger: BinaryMessenger, api: ArtistHostApi?, messageChannelSuffix: String = "") {
      val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.ArtistHostApi.getAllArtists$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              listOf(api.getAllArtists())
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.ArtistHostApi.getArtistDetailById$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val idArg = args[0] as String
            val wrapped: List<Any?> = try {
              listOf(api.getArtistDetailById(idArg))
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.ArtistHostApi.getArtistsByIds$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val idsArg = args[0] as List<String>
            val wrapped: List<Any?> = try {
              listOf(api.getArtistsByIds(idsArg))
            } catch (exception: Throwable) {
              wrapError(exception)
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
  fun getArtwork(id: String, callback: (Result<ByteArray?>) -> Unit)

  companion object {
    /** The codec used by ArtworkHostApi. */
    val codec: MessageCodec<Any?> by lazy {
      AudioPigeonCodec()
    }
    /** Sets up an instance of `ArtworkHostApi` to handle messages through the `binaryMessenger`. */
    @JvmOverloads
    fun setUp(binaryMessenger: BinaryMessenger, api: ArtworkHostApi?, messageChannelSuffix: String = "") {
      val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.ArtworkHostApi.getArtwork$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val idArg = args[0] as String
            api.getArtwork(idArg) { result: Result<ByteArray?> ->
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
  fun start(index: Long, ids: List<String>)
  fun startAllSongs(index: Long)
  fun startAlbumSongs(index: Long, albumId: String)
  fun startArtistSongs(index: Long, artistId: String)
  fun play()
  fun pause()
  fun prev()
  fun next()
  fun seek(time: Double)
  fun setRepeat(repeatMode: RepeatMode)
  fun setShuffle(shuffleMode: ShuffleMode)
  fun getCurrentTime(): Double

  companion object {
    /** The codec used by PlayerHostApi. */
    val codec: MessageCodec<Any?> by lazy {
      AudioPigeonCodec()
    }
    /** Sets up an instance of `PlayerHostApi` to handle messages through the `binaryMessenger`. */
    @JvmOverloads
    fun setUp(binaryMessenger: BinaryMessenger, api: PlayerHostApi?, messageChannelSuffix: String = "") {
      val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.start$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val indexArg = args[0] as Long
            val idsArg = args[1] as List<String>
            val wrapped: List<Any?> = try {
              api.start(indexArg, idsArg)
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.startAllSongs$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val indexArg = args[0] as Long
            val wrapped: List<Any?> = try {
              api.startAllSongs(indexArg)
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.startAlbumSongs$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val indexArg = args[0] as Long
            val albumIdArg = args[1] as String
            val wrapped: List<Any?> = try {
              api.startAlbumSongs(indexArg, albumIdArg)
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.startArtistSongs$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val indexArg = args[0] as Long
            val artistIdArg = args[1] as String
            val wrapped: List<Any?> = try {
              api.startArtistSongs(indexArg, artistIdArg)
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.play$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              api.play()
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.pause$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              api.pause()
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.prev$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              api.prev()
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.next$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              api.next()
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.seek$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val timeArg = args[0] as Double
            val wrapped: List<Any?> = try {
              api.seek(timeArg)
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.setRepeat$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val repeatModeArg = args[0] as RepeatMode
            val wrapped: List<Any?> = try {
              api.setRepeat(repeatModeArg)
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.setShuffle$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val shuffleModeArg = args[0] as ShuffleMode
            val wrapped: List<Any?> = try {
              api.setShuffle(shuffleModeArg)
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.thinmpf.PlayerHostApi.getCurrentTime$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              listOf(api.getCurrentTime())
            } catch (exception: Throwable) {
              wrapError(exception)
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
/**
 *
 * FlutterApi
 *
 *
 * Generated class from Pigeon that represents Flutter messages that can be called from Kotlin.
 */
class PlayerFlutterApi(private val binaryMessenger: BinaryMessenger, private val messageChannelSuffix: String = "") {
  companion object {
    /** The codec used by PlayerFlutterApi. */
    val codec: MessageCodec<Any?> by lazy {
      AudioPigeonCodec()
    }
  }
  fun onIsPlayingChange(isPlayingArg: Boolean, callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.thinmpf.PlayerFlutterApi.onIsPlayingChange$separatedMessageChannelSuffix"
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
  fun onPlaybackSongChange(songArg: SongDTO, callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.thinmpf.PlayerFlutterApi.onPlaybackSongChange$separatedMessageChannelSuffix"
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
  fun onError(messageArg: String, callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.thinmpf.PlayerFlutterApi.onError$separatedMessageChannelSuffix"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(listOf(messageArg)) {
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
