# strobolights

The Unification of the My Application Server.

The name is borrowed from the famous piece of SUPERCAR.

It is a masterpiece like a light that illuminates everything.

![SUPERCAR - Strobolights - ニコニコ動画a](https://www.nicovideo.jp/watch/sm21960939)

## Usage

```
(setf strobolights:*additional-components*
 '((:mount "/ter/api/v1"       ter.api.router:*api-v1*)
   (:mount "/aws/api/v1/beach" ahan-whun-shugoi-api.beach:*api-beach*)
   (:mount "/jira/api/v1"      api.jira.router:*v1*)))

(strobolights:start)
```

## Installation

```
(ql:quickload :strobolights)
```

## Author

+ Satoshi Iwasaki (yanqirenshi@gmail.com)

# Copyright

Copyright (c) 2018 Satoshi Iwasaki (yanqirenshi@gmail.com)

# License

MIT
