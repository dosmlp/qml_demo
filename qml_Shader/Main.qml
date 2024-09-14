import QtQuick
import QtQuick.Layouts
import QtMultimedia

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Rectangle {
        Row {
            MediaPlayer {
                source: "D:/Downloads/The Movie Emperor.2024.1080p.WEB-DL.AAC.H.264.mkv"
                autoPlay: true
                videoOutput: video_view
            }
            VideoOutput {
                id: video_view
                width: 400; height: 200
                fillMode: VideoOutput.PreserveAspectFit
            }
            ShaderEffectSource {
                id: source_s
                sourceItem: video_view
            }

            Image {
                id: img
                width: 200
                height: 200
                fillMode: Image.PreserveAspectFit
                source: "wallhaven-gp17xe.jpg"
                layer.enabled: true
                layer.effect:  ShaderEffect {
                    // width: 100
                    // height: 100
                    // property variant src: img
                    vertexShader: "effect.vert.qsb"
                    fragmentShader: "effect.frag.qsb"
                }
            }
            ShaderEffect {
                width: 200
                height: 200
                property variant source: source_s
                vertexShader: "effect.vert.qsb"
                fragmentShader: "effect.frag.qsb"
            }

        }
    }
}
