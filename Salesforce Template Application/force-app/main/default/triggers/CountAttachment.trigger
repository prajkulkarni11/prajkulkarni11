trigger CountAttachment on Attachment (after insert,after delete, after undelete) {
CountAttachment.count(trigger.new);
}