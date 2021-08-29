#!/bin/sh

clear

echo "Compiling..."
gradle build

echo "Please enter a client name and version (example: Client v1):"
read name
if [ ! -d "$name" ] ; then
mkdir "$name"
fi

mv build/libs/* build/libs/"$name".jar
mv build/libs/* "$name"
rm -r build

echo "Building json..."
cd "$name"
JSON_TEXT='{
    "assetIndex": {
        "id": "1.8",
        "sha1": "e264980ad255aad2174cbe4d674c102474ae5202",
        "size": 94650,
        "url": "https://launchermeta.mojang.com/mc/assets/1.8/e264980ad255aad2174cbe4d674c102474ae5202/1.8.json",
        "totalSize": 114708537
    },
    "assets": "1.8",
    "downloads": {
    },
    "id": "'"$name"'",
    "libraries": [
        {
            "name": "com.mojang:netty:1.6",
            "downloads": {
                "artifact": {
                    "size": 7877,
                    "sha1": "4b75825a06139752bd800d9e29c5fd55b8b1b1e4",
                    "path": "com/mojang/netty/1.6/netty-1.6.jar",
                    "url": "https://libraries.minecraft.net/com/mojang/netty/1.6/netty-1.6.jar"
                }
            }
        },
        {
            "name": "oshi-project:oshi-core:1.1",
            "downloads": {
                "artifact": {
                    "size": 30973,
                    "sha1": "9ddf7b048a8d701be231c0f4f95fd986198fd2d8",
                    "path": "oshi-project/oshi-core/1.1/oshi-core-1.1.jar",
                    "url": "https://libraries.minecraft.net/oshi-project/oshi-core/1.1/oshi-core-1.1.jar"
                }
            }
        },
        {
            "name": "net.java.dev.jna:jna:3.4.0",
            "downloads": {
                "artifact": {
                    "size": 1008730,
                    "sha1": "803ff252fedbd395baffd43b37341dc4a150a554",
                    "path": "net/java/dev/jna/jna/3.4.0/jna-3.4.0.jar",
                    "url": "https://libraries.minecraft.net/net/java/dev/jna/jna/3.4.0/jna-3.4.0.jar"
                }
            }
        },
        {
            "name": "net.java.dev.jna:platform:3.4.0",
            "downloads": {
                "artifact": {
                    "size": 913436,
                    "sha1": "e3f70017be8100d3d6923f50b3d2ee17714e9c13",
                    "path": "net/java/dev/jna/platform/3.4.0/platform-3.4.0.jar",
                    "url": "https://libraries.minecraft.net/net/java/dev/jna/platform/3.4.0/platform-3.4.0.jar"
                }
            }
        },
        {
            "name": "com.ibm.icu:icu4j-core-mojang:51.2",
            "downloads": {
                "artifact": {
                    "size": 1634692,
                    "sha1": "63d216a9311cca6be337c1e458e587f99d382b84",
                    "path": "com/ibm/icu/icu4j-core-mojang/51.2/icu4j-core-mojang-51.2.jar",
                    "url": "https://libraries.minecraft.net/com/ibm/icu/icu4j-core-mojang/51.2/icu4j-core-mojang-51.2.jar"
                }
            }
        },
        {
            "name": "net.sf.jopt-simple:jopt-simple:4.6",
            "downloads": {
                "artifact": {
                    "size": 62477,
                    "sha1": "306816fb57cf94f108a43c95731b08934dcae15c",
                    "path": "net/sf/jopt-simple/jopt-simple/4.6/jopt-simple-4.6.jar",
                    "url": "https://libraries.minecraft.net/net/sf/jopt-simple/jopt-simple/4.6/jopt-simple-4.6.jar"
                }
            }
        },
        {
            "name": "com.paulscode:codecjorbis:20101023",
            "downloads": {
                "artifact": {
                    "size": 103871,
                    "sha1": "c73b5636faf089d9f00e8732a829577de25237ee",
                    "path": "com/paulscode/codecjorbis/20101023/codecjorbis-20101023.jar",
                    "url": "https://libraries.minecraft.net/com/paulscode/codecjorbis/20101023/codecjorbis-20101023.jar"
                }
            }
        },
        {
            "name": "com.paulscode:codecwav:20101023",
            "downloads": {
                "artifact": {
                    "size": 5618,
                    "sha1": "12f031cfe88fef5c1dd36c563c0a3a69bd7261da",
                    "path": "com/paulscode/codecwav/20101023/codecwav-20101023.jar",
                    "url": "https://libraries.minecraft.net/com/paulscode/codecwav/20101023/codecwav-20101023.jar"
                }
            }
        },
        {
            "name": "com.paulscode:libraryjavasound:20101123",
            "downloads": {
                "artifact": {
                    "size": 21679,
                    "sha1": "5c5e304366f75f9eaa2e8cca546a1fb6109348b3",
                    "path": "com/paulscode/libraryjavasound/20101123/libraryjavasound-20101123.jar",
                    "url": "https://libraries.minecraft.net/com/paulscode/libraryjavasound/20101123/libraryjavasound-20101123.jar"
                }
            }
        },
        {
            "name": "com.paulscode:librarylwjglopenal:20100824",
            "downloads": {
                "artifact": {
                    "size": 18981,
                    "sha1": "73e80d0794c39665aec3f62eee88ca91676674ef",
                    "path": "com/paulscode/librarylwjglopenal/20100824/librarylwjglopenal-20100824.jar",
                    "url": "https://libraries.minecraft.net/com/paulscode/librarylwjglopenal/20100824/librarylwjglopenal-20100824.jar"
                }
            }
        },
        {
            "name": "com.paulscode:soundsystem:20120107",
            "downloads": {
                "artifact": {
                    "size": 65020,
                    "sha1": "419c05fe9be71f792b2d76cfc9b67f1ed0fec7f6",
                    "path": "com/paulscode/soundsystem/20120107/soundsystem-20120107.jar",
                    "url": "https://libraries.minecraft.net/com/paulscode/soundsystem/20120107/soundsystem-20120107.jar"
                }
            }
        },
        {
            "name": "io.netty:netty-all:4.0.23.Final",
            "downloads": {
                "artifact": {
                    "size": 1779991,
                    "sha1": "0294104aaf1781d6a56a07d561e792c5d0c95f45",
                    "path": "io/netty/netty-all/4.0.23.Final/netty-all-4.0.23.Final.jar",
                    "url": "https://libraries.minecraft.net/io/netty/netty-all/4.0.23.Final/netty-all-4.0.23.Final.jar"
                }
            }
        },
        {
            "name": "com.google.guava:guava:17.0",
            "downloads": {
                "artifact": {
                    "size": 2243036,
                    "sha1": "9c6ef172e8de35fd8d4d8783e4821e57cdef7445",
                    "path": "com/google/guava/guava/17.0/guava-17.0.jar",
                    "url": "https://libraries.minecraft.net/com/google/guava/guava/17.0/guava-17.0.jar"
                }
            }
        },
        {
            "name": "org.apache.commons:commons-lang3:3.3.2",
            "downloads": {
                "artifact": {
                    "size": 412739,
                    "sha1": "90a3822c38ec8c996e84c16a3477ef632cbc87a3",
                    "path": "org/apache/commons/commons-lang3/3.3.2/commons-lang3-3.3.2.jar",
                    "url": "https://libraries.minecraft.net/org/apache/commons/commons-lang3/3.3.2/commons-lang3-3.3.2.jar"
                }
            }
        },
        {
            "name": "commons-io:commons-io:2.4",
            "downloads": {
                "artifact": {
                    "size": 185140,
                    "sha1": "b1b6ea3b7e4aa4f492509a4952029cd8e48019ad",
                    "path": "commons-io/commons-io/2.4/commons-io-2.4.jar",
                    "url": "https://libraries.minecraft.net/commons-io/commons-io/2.4/commons-io-2.4.jar"
                }
            }
        },
        {
            "name": "commons-codec:commons-codec:1.9",
            "downloads": {
                "artifact": {
                    "size": 263965,
                    "sha1": "9ce04e34240f674bc72680f8b843b1457383161a",
                    "path": "commons-codec/commons-codec/1.9/commons-codec-1.9.jar",
                    "url": "https://libraries.minecraft.net/commons-codec/commons-codec/1.9/commons-codec-1.9.jar"
                }
            }
        },
        {
            "name": "net.java.jinput:jinput:2.0.5",
            "downloads": {
                "artifact": {
                    "size": 208338,
                    "sha1": "39c7796b469a600f72380316f6b1f11db6c2c7c4",
                    "path": "net/java/jinput/jinput/2.0.5/jinput-2.0.5.jar",
                    "url": "https://libraries.minecraft.net/net/java/jinput/jinput/2.0.5/jinput-2.0.5.jar"
                }
            }
        },
        {
            "name": "net.java.jutils:jutils:1.0.0",
            "downloads": {
                "artifact": {
                    "size": 7508,
                    "sha1": "e12fe1fda814bd348c1579329c86943d2cd3c6a6",
                    "path": "net/java/jutils/jutils/1.0.0/jutils-1.0.0.jar",
                    "url": "https://libraries.minecraft.net/net/java/jutils/jutils/1.0.0/jutils-1.0.0.jar"
                }
            }
        },
        {
            "name": "com.google.code.gson:gson:2.2.4",
            "downloads": {
                "artifact": {
                    "size": 190432,
                    "sha1": "a60a5e993c98c864010053cb901b7eab25306568",
                    "path": "com/google/code/gson/gson/2.2.4/gson-2.2.4.jar",
                    "url": "https://libraries.minecraft.net/com/google/code/gson/gson/2.2.4/gson-2.2.4.jar"
                }
            }
        },
        {
            "name": "com.mojang:authlib:1.5.21",
            "downloads": {
                "artifact": {
                    "size": 64412,
                    "sha1": "aefba0d5b53fbcb70860bc8046ab95d5854c07a5",
                    "path": "com/mojang/authlib/1.5.21/authlib-1.5.21.jar",
                    "url": "https://libraries.minecraft.net/com/mojang/authlib/1.5.21/authlib-1.5.21.jar"
                }
            }
        },
        {
            "name": "com.mojang:realms:1.7.39",
            "downloads": {
                "artifact": {
                    "size": 443224,
                    "sha1": "c282954ce2a3bc62812e0d41c05f179b3b5839d7",
                    "path": "com/mojang/realms/1.7.39/realms-1.7.39.jar",
                    "url": "https://libraries.minecraft.net/com/mojang/realms/1.7.39/realms-1.7.39.jar"
                }
            }
        },
        {
            "name": "org.apache.commons:commons-compress:1.8.1",
            "downloads": {
                "artifact": {
                    "size": 365552,
                    "sha1": "a698750c16740fd5b3871425f4cb3bbaa87f529d",
                    "path": "org/apache/commons/commons-compress/1.8.1/commons-compress-1.8.1.jar",
                    "url": "https://libraries.minecraft.net/org/apache/commons/commons-compress/1.8.1/commons-compress-1.8.1.jar"
                }
            }
        },
        {
            "name": "org.apache.httpcomponents:httpclient:4.3.3",
            "downloads": {
                "artifact": {
                    "size": 589512,
                    "sha1": "18f4247ff4572a074444572cee34647c43e7c9c7",
                    "path": "org/apache/httpcomponents/httpclient/4.3.3/httpclient-4.3.3.jar",
                    "url": "https://libraries.minecraft.net/org/apache/httpcomponents/httpclient/4.3.3/httpclient-4.3.3.jar"
                }
            }
        },
        {
            "name": "commons-logging:commons-logging:1.1.3",
            "downloads": {
                "artifact": {
                    "size": 62050,
                    "sha1": "f6f66e966c70a83ffbdb6f17a0919eaf7c8aca7f",
                    "path": "commons-logging/commons-logging/1.1.3/commons-logging-1.1.3.jar",
                    "url": "https://libraries.minecraft.net/commons-logging/commons-logging/1.1.3/commons-logging-1.1.3.jar"
                }
            }
        },
        {
            "name": "org.apache.httpcomponents:httpcore:4.3.2",
            "downloads": {
                "artifact": {
                    "size": 282269,
                    "sha1": "31fbbff1ddbf98f3aa7377c94d33b0447c646b6e",
                    "path": "org/apache/httpcomponents/httpcore/4.3.2/httpcore-4.3.2.jar",
                    "url": "https://libraries.minecraft.net/org/apache/httpcomponents/httpcore/4.3.2/httpcore-4.3.2.jar"
                }
            }
        },
        {
            "name": "org.apache.logging.log4j:log4j-api:2.0-beta9",
            "downloads": {
                "artifact": {
                    "size": 108161,
                    "sha1": "1dd66e68cccd907880229f9e2de1314bd13ff785",
                    "path": "org/apache/logging/log4j/log4j-api/2.0-beta9/log4j-api-2.0-beta9.jar",
                    "url": "https://libraries.minecraft.net/org/apache/logging/log4j/log4j-api/2.0-beta9/log4j-api-2.0-beta9.jar"
                }
            }
        },
        {
            "name": "org.apache.logging.log4j:log4j-core:2.0-beta9",
            "downloads": {
                "artifact": {
                    "size": 681134,
                    "sha1": "678861ba1b2e1fccb594bb0ca03114bb05da9695",
                    "path": "org/apache/logging/log4j/log4j-core/2.0-beta9/log4j-core-2.0-beta9.jar",
                    "url": "https://libraries.minecraft.net/org/apache/logging/log4j/log4j-core/2.0-beta9/log4j-core-2.0-beta9.jar"
                }
            }
        },
        {
            "name": "org.lwjgl.lwjgl:lwjgl:2.9.4-nightly-20150209",
            "rules": [
                {
                    "action": "allow"
                },
                {
                    "action": "disallow",
                    "os": {
                        "name": "osx"
                    }
                }
            ],
            "downloads": {
                "artifact": {
                    "size": 1047168,
                    "sha1": "697517568c68e78ae0b4544145af031c81082dfe",
                    "path": "org/lwjgl/lwjgl/lwjgl/2.9.4-nightly-20150209/lwjgl-2.9.4-nightly-20150209.jar",
                    "url": "https://libraries.minecraft.net/org/lwjgl/lwjgl/lwjgl/2.9.4-nightly-20150209/lwjgl-2.9.4-nightly-20150209.jar"
                }
            }
        },
        {
            "name": "org.lwjgl.lwjgl:lwjgl_util:2.9.4-nightly-20150209",
            "rules": [
                {
                    "action": "allow"
                },
                {
                    "action": "disallow",
                    "os": {
                        "name": "osx"
                    }
                }
            ],
            "downloads": {
                "artifact": {
                    "size": 173887,
                    "sha1": "d51a7c040a721d13efdfbd34f8b257b2df882ad0",
                    "path": "org/lwjgl/lwjgl/lwjgl_util/2.9.4-nightly-20150209/lwjgl_util-2.9.4-nightly-20150209.jar",
                    "url": "https://libraries.minecraft.net/org/lwjgl/lwjgl/lwjgl_util/2.9.4-nightly-20150209/lwjgl_util-2.9.4-nightly-20150209.jar"
                }
            }
        },
        {
            "extract": {
                "exclude": [
                    "META-INF/"
                ]
            },
            "name": "org.lwjgl.lwjgl:lwjgl-platform:2.9.4-nightly-20150209",
            "natives": {
                "linux": "natives-linux",
                "osx": "natives-osx",
                "windows": "natives-windows"
            },
            "rules": [
                {
                    "action": "allow"
                },
                {
                    "action": "disallow",
                    "os": {
                        "name": "osx"
                    }
                }
            ],
            "downloads": {
                "classifiers": {
                    "natives-linux": {
                        "size": 578680,
                        "sha1": "931074f46c795d2f7b30ed6395df5715cfd7675b",
                        "path": "org/lwjgl/lwjgl/lwjgl-platform/2.9.4-nightly-20150209/lwjgl-platform-2.9.4-nightly-20150209-natives-linux.jar",
                        "url": "https://libraries.minecraft.net/org/lwjgl/lwjgl/lwjgl-platform/2.9.4-nightly-20150209/lwjgl-platform-2.9.4-nightly-20150209-natives-linux.jar"
                    },
                    "natives-osx": {
                        "size": 426822,
                        "sha1": "bcab850f8f487c3f4c4dbabde778bb82bd1a40ed",
                        "path": "org/lwjgl/lwjgl/lwjgl-platform/2.9.4-nightly-20150209/lwjgl-platform-2.9.4-nightly-20150209-natives-osx.jar",
                        "url": "https://libraries.minecraft.net/org/lwjgl/lwjgl/lwjgl-platform/2.9.4-nightly-20150209/lwjgl-platform-2.9.4-nightly-20150209-natives-osx.jar"
                    },
                    "natives-windows": {
                        "size": 613748,
                        "sha1": "b84d5102b9dbfabfeb5e43c7e2828d98a7fc80e0",
                        "path": "org/lwjgl/lwjgl/lwjgl-platform/2.9.4-nightly-20150209/lwjgl-platform-2.9.4-nightly-20150209-natives-windows.jar",
                        "url": "https://libraries.minecraft.net/org/lwjgl/lwjgl/lwjgl-platform/2.9.4-nightly-20150209/lwjgl-platform-2.9.4-nightly-20150209-natives-windows.jar"
                    }
                },
                "artifact": {
                    "size": 22,
                    "sha1": "b04f3ee8f5e43fa3b162981b50bb72fe1acabb33",
                    "path": "org/lwjgl/lwjgl/lwjgl-platform/2.9.4-nightly-20150209/lwjgl-platform-2.9.4-nightly-20150209.jar",
                    "url": "https://libraries.minecraft.net/org/lwjgl/lwjgl/lwjgl-platform/2.9.4-nightly-20150209/lwjgl-platform-2.9.4-nightly-20150209.jar"
                }
            }
        },
        {
            "name": "org.lwjgl.lwjgl:lwjgl:2.9.2-nightly-20140822",
            "rules": [
                {
                    "action": "allow",
                    "os": {
                        "name": "osx"
                    }
                }
            ],
            "downloads": {
                "artifact": {
                    "size": 1045632,
                    "sha1": "7707204c9ffa5d91662de95f0a224e2f721b22af",
                    "path": "org/lwjgl/lwjgl/lwjgl/2.9.2-nightly-20140822/lwjgl-2.9.2-nightly-20140822.jar",
                    "url": "https://libraries.minecraft.net/org/lwjgl/lwjgl/lwjgl/2.9.2-nightly-20140822/lwjgl-2.9.2-nightly-20140822.jar"
                }
            }
        },
        {
            "name": "org.lwjgl.lwjgl:lwjgl_util:2.9.2-nightly-20140822",
            "rules": [
                {
                    "action": "allow",
                    "os": {
                        "name": "osx"
                    }
                }
            ],
            "downloads": {
                "artifact": {
                    "size": 173887,
                    "sha1": "f0e612c840a7639c1f77f68d72a28dae2f0c8490",
                    "path": "org/lwjgl/lwjgl/lwjgl_util/2.9.2-nightly-20140822/lwjgl_util-2.9.2-nightly-20140822.jar",
                    "url": "https://libraries.minecraft.net/org/lwjgl/lwjgl/lwjgl_util/2.9.2-nightly-20140822/lwjgl_util-2.9.2-nightly-20140822.jar"
                }
            }
        },
        {
            "extract": {
                "exclude": [
                    "META-INF/"
                ]
            },
            "name": "org.lwjgl.lwjgl:lwjgl-platform:2.9.2-nightly-20140822",
            "natives": {
                "linux": "natives-linux",
                "osx": "natives-osx",
                "windows": "natives-windows"
            },
            "rules": [
                {
                    "action": "allow",
                    "os": {
                        "name": "osx"
                    }
                }
            ],
            "downloads": {
                "classifiers": {
                    "natives-linux": {
                        "size": 578539,
                        "sha1": "d898a33b5d0a6ef3fed3a4ead506566dce6720a5",
                        "path": "org/lwjgl/lwjgl/lwjgl-platform/2.9.2-nightly-20140822/lwjgl-platform-2.9.2-nightly-20140822-natives-linux.jar",
                        "url": "https://libraries.minecraft.net/org/lwjgl/lwjgl/lwjgl-platform/2.9.2-nightly-20140822/lwjgl-platform-2.9.2-nightly-20140822-natives-linux.jar"
                    },
                    "natives-osx": {
                        "size": 468116,
                        "sha1": "79f5ce2fea02e77fe47a3c745219167a542121d7",
                        "path": "org/lwjgl/lwjgl/lwjgl-platform/2.9.2-nightly-20140822/lwjgl-platform-2.9.2-nightly-20140822-natives-osx.jar",
                        "url": "https://libraries.minecraft.net/org/lwjgl/lwjgl/lwjgl-platform/2.9.2-nightly-20140822/lwjgl-platform-2.9.2-nightly-20140822-natives-osx.jar"
                    },
                    "natives-windows": {
                        "size": 613680,
                        "sha1": "78b2a55ce4dc29c6b3ec4df8ca165eba05f9b341",
                        "path": "org/lwjgl/lwjgl/lwjgl-platform/2.9.2-nightly-20140822/lwjgl-platform-2.9.2-nightly-20140822-natives-windows.jar",
                        "url": "https://libraries.minecraft.net/org/lwjgl/lwjgl/lwjgl-platform/2.9.2-nightly-20140822/lwjgl-platform-2.9.2-nightly-20140822-natives-windows.jar"
                    }
                }
            }
        },
        {
            "extract": {
                "exclude": [
                    "META-INF/"
                ]
            },
            "name": "net.java.jinput:jinput-platform:2.0.5",
            "natives": {
                "linux": "natives-linux",
                "osx": "natives-osx",
                "windows": "natives-windows"
            },
            "downloads": {
                "classifiers": {
                    "natives-linux": {
                        "size": 10362,
                        "sha1": "7ff832a6eb9ab6a767f1ade2b548092d0fa64795",
                        "path": "net/java/jinput/jinput-platform/2.0.5/jinput-platform-2.0.5-natives-linux.jar",
                        "url": "https://libraries.minecraft.net/net/java/jinput/jinput-platform/2.0.5/jinput-platform-2.0.5-natives-linux.jar"
                    },
                    "natives-osx": {
                        "size": 12186,
                        "sha1": "53f9c919f34d2ca9de8c51fc4e1e8282029a9232",
                        "path": "net/java/jinput/jinput-platform/2.0.5/jinput-platform-2.0.5-natives-osx.jar",
                        "url": "https://libraries.minecraft.net/net/java/jinput/jinput-platform/2.0.5/jinput-platform-2.0.5-natives-osx.jar"
                    },
                    "natives-windows": {
                        "size": 155179,
                        "sha1": "385ee093e01f587f30ee1c8a2ee7d408fd732e16",
                        "path": "net/java/jinput/jinput-platform/2.0.5/jinput-platform-2.0.5-natives-windows.jar",
                        "url": "https://libraries.minecraft.net/net/java/jinput/jinput-platform/2.0.5/jinput-platform-2.0.5-natives-windows.jar"
                    }
                }
            }
        },
        {
            "name": "tv.twitch:twitch:6.5",
            "downloads": {
                "artifact": {
                    "size": 55977,
                    "sha1": "320a2dfd18513a5f41b4e75729df684488cbd925",
                    "path": "tv/twitch/twitch/6.5/twitch-6.5.jar",
                    "url": "https://libraries.minecraft.net/tv/twitch/twitch/6.5/twitch-6.5.jar"
                }
            }
        },
        {
            "extract": {
                "exclude": [
                    "META-INF/"
                ]
            },
            "name": "tv.twitch:twitch-platform:6.5",
            "natives": {
                "linux": "natives-linux",
                "osx": "natives-osx",
                "windows": "natives-windows-${arch}"
            },
            "rules": [
                {
                    "action": "allow"
                },
                {
                    "action": "disallow",
                    "os": {
                        "name": "linux"
                    }
                }
            ],
            "downloads": {
                "classifiers": {
                    "natives-osx": {
                        "size": 455359,
                        "sha1": "5f9d1ee26257b3a33f0ca06fed335ef462af659f",
                        "path": "tv/twitch/twitch-platform/6.5/twitch-platform-6.5-natives-osx.jar",
                        "url": "https://libraries.minecraft.net/tv/twitch/twitch-platform/6.5/twitch-platform-6.5-natives-osx.jar"
                    },
                    "natives-windows-32": {
                        "size": 474225,
                        "sha1": "206c4ccaecdbcfd2a1631150c69a97bbc9c20c11",
                        "path": "tv/twitch/twitch-platform/6.5/twitch-platform-6.5-natives-windows-32.jar",
                        "url": "https://libraries.minecraft.net/tv/twitch/twitch-platform/6.5/twitch-platform-6.5-natives-windows-32.jar"
                    },
                    "natives-windows-64": {
                        "size": 580098,
                        "sha1": "9fdd0fd5aed0817063dcf95b69349a171f447ebd",
                        "path": "tv/twitch/twitch-platform/6.5/twitch-platform-6.5-natives-windows-64.jar",
                        "url": "https://libraries.minecraft.net/tv/twitch/twitch-platform/6.5/twitch-platform-6.5-natives-windows-64.jar"
                    }
                }
            }
        },
        {
            "extract": {
                "exclude": [
                    "META-INF/"
                ]
            },
            "name": "tv.twitch:twitch-external-platform:4.5",
            "natives": {
                "windows": "natives-windows-${arch}"
            },
            "rules": [
                {
                    "action": "allow",
                    "os": {
                        "name": "windows"
                    }
                }
            ],
            "downloads": {
                "classifiers": {
                    "natives-windows-32": {
                        "size": 5654047,
                        "sha1": "18215140f010c05b9f86ef6f0f8871954d2ccebf",
                        "path": "tv/twitch/twitch-external-platform/4.5/twitch-external-platform-4.5-natives-windows-32.jar",
                        "url": "https://libraries.minecraft.net/tv/twitch/twitch-external-platform/4.5/twitch-external-platform-4.5-natives-windows-32.jar"
                    },
                    "natives-windows-64": {
                        "size": 7457619,
                        "sha1": "c3cde57891b935d41b6680a9c5e1502eeab76d86",
                        "path": "tv/twitch/twitch-external-platform/4.5/twitch-external-platform-4.5-natives-windows-64.jar",
                        "url": "https://libraries.minecraft.net/tv/twitch/twitch-external-platform/4.5/twitch-external-platform-4.5-natives-windows-64.jar"
                    }
                }
            }
        }
    ],
    "logging": {
        "client": {
            "file": {
                "id": "client-1.7.xml",
                "sha1": "6605d632a2399010c0085d3e4da58974d62ccdfe",
                "size": 871,
                "url": "https://launchermeta.mojang.com/mc/log_configs/client-1.7.xml/6605d632a2399010c0085d3e4da58974d62ccdfe/client-1.7.xml"
            },
            "argument": "-Dlog4j.configurationFile=${path}",
            "type": "log4j2-xml"
        }
    },
    "mainClass": "net.minecraft.client.main.Main",
    "minecraftArguments": "--username ${auth_player_name} --version ${version_name} --gameDir ${game_directory} --assetsDir ${assets_root} --assetIndex ${assets_index_name} --uuid ${auth_uuid} --accessToken ${auth_access_token} --userProperties ${user_properties} --userType ${user_type}",
    "minimumLauncherVersion": 14,
    "releaseTime": "2015-07-27T10:31:28+00:00",
    "time": "2016-06-01T11:45:48+00:00",
    "type": "release"
}'

echo "$JSON_TEXT" > "$name".json

cd ../

echo "Complete!"
