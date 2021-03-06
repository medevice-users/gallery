# The DocPad Configuration File
# It is simply a CoffeeScript Object which is parsed by CSON
port = process.env.PORT || 9778
docpadConfig =

  port: (port)
  # Template Data
  # =============
  # These are variables that will be accessible via our templates
  # To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

  templateData:

    # Specify some site properties
    site:
      # The production url of our website
      url: "http://medevice-users.github.io/gallery/index.html"

      # Here are some old site urls that you would like to redirect from
      oldUrls: [
        # 'www.website.com',
      ]

      # The default title of our website
      title: "Diabetes Visualisations"

      # The website description (for SEO)
      description: """
        Visualizing diabetes data.  Redesigning diabetes care from the
        bazaar.
        """

      # The website keywords (for SEO) separated by commas
      keywords: """
        visualisations, gallery, blog, type 1 diabetes,
        open source, diabetes design
        """

      # The website author's name
      author: "Joyce Lee"

      # The website author's email
      email: "medevice@googlegroups.com"

      # Your company's name
      copyright: "Medevice collaborators, Joyce Lee, et al"

      services:
        googleAnalytics: 'UA-42880063-1'
        twitterFollowButton: 'medevice'
        githubFollowButton: 'medevice-users'

    # Helper Functions
    # ----------------
    # Get absolute URL
    getUrl: (document) ->
      return @site.url + (document.url or document.get?('url'))


    getViewGH: ->
      prefix = 'https://github.com/medevice-users/gallery'
      action = 'blob/master/src/documents'
      path = @document.relativePath
      "#{prefix}/#{action}/#{path}"
    getProse: ->
      prefix = 'http://prose.io/#medevice-users/gallery'
      edit = 'edit/master/src/documents'
      path = @document.relativePath
      "#{prefix}/#{edit}/#{path}"
    getGithub: ->
      prefix = 'https://github.com/medevice-users/gallery'
      edit = 'edit/master/src/documents'
      path = @document.relativePath
      "#{prefix}/#{edit}/#{path}"

    getAuthor: (document) ->
      author = @site.author
      if document and document.author
        author = document.author
      return author

    # Get the prepared site/document title
    # Often we would like to specify particular formatting to our page's title
    # we can apply that formatting here
    getPreparedTitle: ->
      # if we have a document title, then we should use that and suffix the site's title onto it
      if @document.title
        "#{@document.title} | #{@site.title}"
      # if our document does not have it's own title, then we should just use the site's title
      else
        @site.title

    # Get the prepared site/document description
    getPreparedDescription: ->
      # if we have a document description, then we should use that, otherwise use the site's description
      @document.description or @site.description

    # Get the prepared site/document keywords
    getPreparedKeywords: ->
      # Merge the document keywords with the site keywords
      @site.keywords.concat(@document.keywords or []).join(', ')


  # Collections
  # ===========
  # These are special collections that our website makes available to us

  collections:
    # For instance, this one will fetch in all documents that have pageOrder set within their meta data
    pages: (database) ->
      database.findAllLive({pageOrder: $exists: true}, [pageOrder:1,title:1])

    # This one, will fetch in all documents that will be outputted to the posts
    # directory
    posts: (database) ->
      database.findAllLive({relativeOutDirPath:'posts'},[date:-1])


  # DocPad Events
  # =============

  # Here we can define handlers for events that DocPad fires
  # You can find a full listing of events on the DocPad Wiki
  events:

    # Server Extend
    # Used to add our own custom routes to the server before the docpad routes
    # are added
    serverExtend: (opts) ->
      # Extract the server from the options
      {server} = opts
      docpad = @docpad

      # As we are now running in an event,
      # ensure we are using the latest copy of the docpad configuraiton
      # and fetch our urls from it
      latestConfig = docpad.getConfig()
      oldUrls = latestConfig.templateData.site.oldUrls or []
      newUrl = latestConfig.templateData.site.url

      # Redirect any requests accessing one of our sites oldUrls to the new site url
      server.use (req,res,next) ->
        if req.headers.host in oldUrls
          res.redirect 301, newUrl+req.url
        else
          next()

  environments:
    development:
      templateData:
        site:
          url: "http://localhost:#{port}/index.html"

# Export our DocPad Configuration
module.exports = docpadConfig
