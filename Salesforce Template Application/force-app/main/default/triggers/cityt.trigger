trigger cityt on Account (before update) {

    City.getcity(trigger.new);
}