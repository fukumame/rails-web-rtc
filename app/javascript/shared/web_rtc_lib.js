import SimpleWebRTC from 'simplewebrtc';

var webrtc = new SimpleWebRTC({
  // the id/element dom element that will hold "our" video
  localVideoEl: 'localVideo',
  // the id/element dom element that will hold remote videos
  remoteVideosEl: '',
  // immediately ask for camera access
  autoRequestMedia: true,
  url: 'https://rtc.caster-rtc.work/',
  media: { video: { width: 320, height: 240, frameRate: 20 }, audio: true }
});

// a peer video has been added
webrtc.on('videoAdded', function (video, peer) {
  console.log('video added', peer);
  var remotes = document.getElementById('remotesVideos');
  if (remotes) {
    video.setAttribute("playsinline", true);
    video.className = 'remote-video video';
    var container = document.createElement('div');
    container.className = 'videoContainer';
    container.id = 'container_' + webrtc.getDomId(peer);
    container.appendChild(video);
    // suppress contextmenu
    video.oncontextmenu = function () { return false; };
    remotes.appendChild(container);
  }
});

// a peer video was removed
webrtc.on('videoRemoved', function (video, peer) {
  console.log('video removed ', peer);
  var remotes = document.getElementById('remotesVideos');
  var el = document.getElementById(peer ? 'container_' + webrtc.getDomId(peer) : 'localScreenContainer');
  if (remotes && el) {
    remotes.removeChild(el);
  }
});