var audioPlayer = angular.module('audioPlayer', []);

	audioPlayer.factory('audio', function($document) {
	  var audio = $document[0].createElement('audio');
	  return audio;
	});

	audioPlayer.factory('player', function(audio, $rootScope) {
	  var player = {

	    current: null,
	    progress: 0,
	    playing: false,
	    ready: false,

	    play: function(program) {
	      if (player.playing) 
	        player.stop();

	      var url = program;
	      player.current = program;
	      audio.src = url;
	      audio.play();
	      player.playing = true;
	    },
	    stop: function() {
	      if (player.playing) {
	        audio.pause();
	        player.playing = false;
	        player.current = null;
	      }
	    },
	    currentTime: function() {
	      return audio.currentTime;
	    },
	    currentDuration: function() {
	      return audio.duration;
	    }
	  };
	  audio.addEventListener('canplay', function(evt) {
	    $rootScope.$apply(function() {
	      player.ready = true;
	    });
	  });
	  audio.addEventListener('timeupdate', function(evt) {
	    $rootScope.$apply(function() {
	      player.progress = player.currentTime();
	      player.progress_percent = player.progress / player.currentDuration();
	    });
	  });
	  audio.addEventListener('ended', function() {
	    $rootScope.$apply(player.stop());
	  });
	  return player;
	});