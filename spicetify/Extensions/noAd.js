// @ts-check

// NAME: Auto Skip Video
// AUTHOR: khanhas
// DESCRIPTION: Auto skip video

/// <reference path="../globals.d.ts" />

(function SkipVideo() {
    Spicetify.Player.addEventListener("songchange", () => {
        const data = Spicetify.Player.data || Spicetify.Queue;
        if (!data) return;

        const isAd = data.track.metadata.is_advertisement === "true"
        
        if (isAd) {
            console.log("mute");
            Spicetify.Player.setMute(true);
            return
        }

        console.log("unmute");
        Spicetify.Player.setMute(false);
    });
})();
