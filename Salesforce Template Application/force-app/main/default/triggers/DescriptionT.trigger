trigger DescriptionT on Account (before insert, before update) {

     Description.getdescription(trigger.new);
}