package dev.tcode.thinmpf.extension

import dev.tcode.thinmpf.model.contract.SongModelContract
import dev.tcode.thinmpf.pigeon_output.SongDTO

fun SongModelContract.toPigeon(): SongDTO {
    return SongDTO(
        id = this.id.raw,
        name = this.name,
        albumId = this.albumId.raw,
        albumName = this.albumName,
        artistId = this.artistId.raw,
        artistName = this.artistName,
        imageId = this.imageId,
        duration = this.duration.toDouble() / 1000,
        trackNumber = this.trackNumber
    )
}
