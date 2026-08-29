# Wyoming Piper for Unraid

Local text-to-speech for Home Assistant using Wyoming Piper.

## Included

- Wyoming Piper 2.4.2
- Piper TTS backend
- Wyoming TCP port `10200`
- Default voice `en_US-lessac-medium`
- Persistent voice/model storage at `/data`
- Semantic image tags: `latest`, `1.0.0`, `1.0`, `1`
- Unraid Docker template

## Unraid install

Copy the template to Unraid:

```bash
wget -O /boot/config/plugins/dockerMan/templates-user/my-Wyoming-Piper.xml \
https://raw.githubusercontent.com/GraceO77/wyoming-piper-unraid/main/templates/Wyoming-Piper.xml
```

Then use **Docker → Add Container → Template → Wyoming-Piper**.

Image:

```text
ghcr.io/graceo77/wyoming-piper-unraid:latest
```

Default settings:

```text
Port: 10200
Data: /mnt/user/appdata/wyoming-piper/data -> /data
Voice: en_US-lessac-medium
```

## Home Assistant

Add the **Wyoming Protocol** integration and connect to:

```text
Host: <Unraid server IP>
Port: 10200
```

Then select Piper as the Text-to-speech provider in the Assist pipeline.

## Voice selection

The Unraid template exposes `PIPER_VOICE`. Change it to another Piper voice model if desired. Upstream example:

```text
en_US-lessac-medium
```

The selected voice is downloaded into `/data` on first use.

## Versioning

Current application version is stored in `VERSION` and is included in the Docker image metadata. GHCR publishes `latest`, full semantic version, major/minor and major tags.

## Upstream

- Wyoming Piper: https://github.com/OHF-Voice/wyoming-piper
- Piper TTS: https://github.com/OHF-Voice/piper1-gpl
