public class ContentController {
    public blob file { get; set; }

    public PageReference upload() {
        ContentVersion v = new ContentVersion();
        v.versionData = file;
        v.title = 'testing upload';
        v.pathOnClient ='/somepath.txt';
        v.FirstPublishLocationId='5002v00002U5RL1AAN';
        insert v;
        return new PageReference('/' + v.id);
    }
}