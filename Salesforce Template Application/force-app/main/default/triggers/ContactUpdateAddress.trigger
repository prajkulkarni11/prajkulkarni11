trigger ContactUpdateAddress on Account (before update) {

         AccountAddress.updateAddress(trigger.new);

}