# Existing chat host connection

This fork preserves the upstream UI, prompts, storage and memory rules. Its only
image change makes the existing `SEREIN_BASE_PATH` build setting available to
the Gateway Dockerfile. The optional constrained Compose override adds resource
and log limits; it does not enable every paid background feature.

An existing Morrow host can use the official OpenAI-compatible `/v1` Gateway and
the official `/serein/mcp` endpoint. Keep a stable `X-Serein-Window-ID` for each
conversation, private Gateway credentials on the server, and separate display
passwords from model-provider keys.

When mounting the UI below `/ob2/`, both the Vite build and preview process need
`SEREIN_BASE_PATH=/ob2/`. Its browser APIs still use the official `/__serein/`
prefix and need their own reverse-proxy location. Preserve the official
Gateway's authentication there. MCP, OAuth discovery and `/v1` remain separate
authenticated locations. The Python database/API need not be public.

Gateway archive behavior, Scene tool writes, Event processing and optional
features are those of the upstream source. A client-side conversation deletion
does not imply withdrawal from a separate memory service. Do not advertise
an unimplemented cross-system deletion protocol.

All runtime model choices, credentials and instance files remain private.
