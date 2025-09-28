# AOM Founder Family App 🥝

FlutterFlow-built community prototype that helps Founder Family members sign in,
share updates, and stay connected across mobile, web, and desktop targets.

## Tech Stack 🛠️

-   Flutter (SDK >= 3.0 < 4.0, stable channel recommended)
-   Firebase: Auth, Cloud Firestore, Storage, Performance
-   FlutterFlow component library, Provider, `go_router`, Google Fonts

## Prerequisites 📋

1. Flutter SDK on the stable channel (`flutter --version` to verify).
2. Firebase project with Email/Password Authentication, Firestore, and Storage
   enabled.
3. FlutterFire CLI (`dart pub global activate flutterfire_cli`) if you prefer
   automated platform configs.

## Quick Start ⚡

1. Install packages: `flutter pub get`.
2. Configure Firebase:
    - Android: add `android/app/google-services.json`.
    - iOS/macOS: add `ios/Runner/GoogleService-Info.plist` (and macOS equivalent
      if needed).
    - Web: update `lib/backend/firebase/firebase_config.dart` with your web app
      keys.
3. (Optional) Run `flutterfire configure` to generate platform files
   automatically.
4. Launch the app: `flutter run -d <device>`.
5. Run checks: `flutter analyze` and `flutter test`.

## Development Approach 🧠

### What I Built and Why

I wanted to ground the feature I built in the real world. So I asked ‘What would
real founders want out of an app like this?’ I have no experience as a founder
yet, so I resorted to what I do know and is still relevant to the challenge:
**family**.

I thought: what's most important to me as it relates to my family? The following
aspects came to mind:

1. Staying up to date with others: Sharing struggles, ideas, successes
2. Ease of comms and connection: Easy channels - in real life: FaceTime,
   Whatsapp.
3. Resource sharing: Youtube videos, podcasts, books

Within the context of a Founder family:

1. Sharing startup ideas, success stories, failure stories, health/wellbeing
   struggles
2. Direct communication with other founders; Text messaging, Voice notes, Video
   calls
3. Sharing resources; New books (Connect to goodreads/Kindle), Podcasts
   (Spotify, Apple Podcasts), Youtube Videos

This led me to come up with the feature I implemented:

**A post feed, old-skool Facebook style, to share ideas, successes and struggles
between Founders.**

Considering the AoM Founders Family is exactly that, a family, I believe a place
for communication and sharing of ideas, successes and failures is an essential
aspect of the community app.

The MVP for this involved just the core Sign In/Post Creation user flow:

_Sign In/Up → Click the yellow 'Add' icon to open the ‘Create Post’ page ​→
Writing something in the text box, having the option to choose a Category and
Image → Hit ‘Add Post’ → Post is uploaded to the Firestore → User is redirected
to the Home Page, and the new post is visible on the feed._

_Note: Currently, posts created by the Authenticated user show up for the
Authenticated user, which isn’t necessarily the best approach for UX design. To
work around this, the Container component that holds each post can be wrapped in
a Visible parent class, and the condition can be set to only show the child (the
post) if the ‘poster’ field of the post Document (User Document Reference) is
NOT equal to the Authenticated user._

As a way to flesh out the full app layout and user experience, and also to show
some initiative and creativity, I built 3 pages: the Home page, Messages page,
and the Profile page.

For the scope and purpose of the challenge, I only built out the Home page for
the MVP. The messages and profile pages are there as place holders, as a way to
illustrate what I would work on next.

I also implemented a short User Authentication flow with a Sign In/Sign Up page.
This made a lot of sense to me, especially as the core feature I built required
individual users to add posts to a globally visible data store.

Flutter, FlutterFlow and the Dart coding language have not been my go to tools
and workflows for mobile development in the past, so it required some upskilling
initially.

I watched some tutorials on YouTube from the FlutterFlow university channel to
quickly learn how to use the tool to build the features I wanted.

### One Thing I Struggled With + How I Solved It

When creating the action for Signing Up, I initially used the built in
FutterFlow action, `Create Account`

This automated a lot of the User creation. However it imposed a limitation:

The only fields available to be added directly from the form were email and
password, but this posed an issue when creating the post component, since I
wanted the post card to show a Display Name.

This meant I needed to add this as a field in the Sign Up form, and then work
out how to include this field in User creation.

After some researching and playing with custom actions, I realised I can set the
fields to be added at User creation in the action properties pane, inside the
Action Flow Editor.

Eventually this wasn't too complicated, but it took some time to work out, and
it taught me a lot about custom actions and backend actions in Flutter Flow.

### Code Elements I am Proud Of

A small UI bug I really wanted to fix was the scrolling of the posts.

Initially, when I scrolled to the bottom on the home page, the page auto
scrolled back to the top

I fixed this by downloading the code and making some manual code edits in VS
code - I added a ScrollController and added it to the ListView.builder.

_Although, this fixed one issue, and created another…_

I then ran into the problem of the search bar scrolling with the page. I was
able to fix this pretty quickly with some assistance from GPT and Codex.

It was motivating for me to be able to quickly learn and interpret Dart code,
and make edits where necessary.

I'm also really proud of the sign up action I discussed above, as well as adding
in custom ChoiceChips for the category of each post and pulling it successfully
from the DB.

### What I’d Do If I Had 5 More Hours

I have a list of things that I would want to work on if I had more time or if I
was building this app for production.

These include:

-   Fixing the image upload for certain file types to establish the robustness
    of the current functionality - currently some file types fail to upload on
    the Create Post page. I would need to spend some more time testing this and
    work on a fix.

-   I would then work on Likes, Comments and Sharing of each post, as well as
    some extra post options, like saving and link copying. Also embedded links
    for Youtube videos and external resources.

-   I would then work on a Search feature, either inside the homepage or on a
    separate tab, which would allow a user to search for other founder profiles,
    specific posts or topics

-   Messaging would be a good next step too, but would probably be a big task,
    as I’d want to include text, video and voice notes and potentially video
    calls.

-   I thought about also adding some profile customisation, such as a Bio,
    business experience, and current projects

-   Also a Forgot Password flow would be super useful, as well as a notification
    centre In terms of long term scalability, once the user base is large
    enough, you could also introduce friends/connections/follows as a way to
    build a tighter network of founders closest to you.

Eventually you could also introduce some external integrations, like Goodreads,
Kindle and Apple podcasts, and also a sorting algorithm to determine the posts
that are most relevant to each user. I'd also spend some time learning more
about Flutter best practice and architecture to improve performance and
scalability.
