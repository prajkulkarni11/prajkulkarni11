public class CountAttachment {
public static void count(list<Attachment> alist)
{
    integer co =[select  count() from attachment];
    system.debug(co);
}
}