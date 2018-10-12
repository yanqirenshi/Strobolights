# strobolights

The Unification of the My Application Server.

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
