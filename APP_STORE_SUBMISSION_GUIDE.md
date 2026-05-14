# SKY BIRD DASH - App Store Submission Guide

## Quick Reference

**App Name:** Sky Bird Dash  
**Tagline:** Navigate the Skies  
**Category:** Games > Casual  
**Age Rating:** 4+ (PEGI 3)  
**Version to Submit:** 2.0.0  
**Build Number:** 1

---

## Step 1: Prepare Your App Build

### iOS Build

```bash
cd "/Users/shimaahossni/Desktop/flutter projects/flappy_bird_game"

# Clean and get dependencies
flutter clean
flutter pub get

# Build release iOS app
flutter build ios --release

# Or create Archive for App Store
flutter build ios --release
open ios/Runner.xcworkspace
```

Then in Xcode:
- Product → Archive
- Distribute App
- App Store Connect
- Follow Apple's upload process

### Android Build

```bash
cd "/Users/shimaahossni/Desktop/flutter projects/flappy_bird_game"

# Clean and get dependencies
flutter clean
flutter pub get

# Build App Bundle (required for Google Play)
flutter build appbundle --release

# Output: build/app/outputs/bundle/release/app-release.aab
```

---

## Step 2: iOS App Store Connect Setup

### Login to App Store Connect
1. Go to: https://appstoreconnect.apple.com
2. Sign in with Apple Developer account
3. Click "My Apps"
4. Create new app or use existing

### Fill in App Information

**1. App Name & Metadata:**
```
App Name: Sky Bird Dash
Subtitle: Navigate the Skies
Bundle ID: [Your existing bundle ID]
SKU: [Your SKU]
Category: Games > Casual
Content Rights: Owned
Age Rating: 4+ (PEGI 3)
```

**2. General Information Tab:**
- Copyright: © 2026 [Your Name/Company]
- Primary Language: English
- Privacy Policy URL: [Your privacy policy]
- Support URL: [Your support page]

**3. App Information Tab:**
- App Name: Sky Bird Dash
- Subtitle: Navigate the Skies

**4. Rating Tab:**
- Violence: None
- Profanity: None
- Gambling: None
- Alcohol/Tobacco: None
- Explicit Sexual Content: None
- Medical Information: None
- Horror/Fear: None
- Prolonged Violence: None

**5. Version Release Tab:**
- Version Number: 2.0.0
- Build Number: 1 (or current)
- Release Notes:
  ```
  Complete rebranding from Flappy Bird to Sky Bird Dash!
  
  What's New:
  • New name: Sky Bird Dash with butterfly character
  • Three difficulty levels: Easy, Medium, Hard
  • Cyberpunk-inspired visual theme (purple & blue)
  • Improved UI and menu screens
  • Enhanced gameplay mechanics
  
  Sky Bird Dash is an engaging casual flying game 
  featuring beautiful visuals and multiple 
  difficulty options for all skill levels!
  ```

### Add Screenshots

**Requirements:**
- Resolution: 1170 x 2532 pixels (iPhone Pro)
- Format: PNG or JPEG
- Minimum 1, Maximum 10 per language

**Create 5-6 screenshots showing:**

1. **Main Menu**
   - Title: "Sky Bird Dash"
   - Subtitle: "Navigate the Skies"
   - Butterfly character prominently displayed
   - "TAP TO PLAY" button visible
   - Purple/blue gradient background

2. **Difficulty Selection**
   - Three difficulty buttons (Easy, Medium, Hard)
   - Descriptions for each
   - Glowing effects
   - Show the choice players make

3. **Easy Mode Gameplay**
   - Butterfly character flying
   - Wide gaps between pipes
   - Slow-paced gameplay
   - Score visible
   - Purple/blue theme evident

4. **Medium Mode Gameplay**
   - Butterfly navigating through pipes
   - Balanced difficulty
   - Medium-speed gameplay
   - Score increasing
   - Action-focused

5. **Hard Mode Gameplay**
   - Intense, fast gameplay
   - Narrow pipe gaps
   - High-speed action
   - Challenging obstacle avoidance
   - Adrenaline-pumping visuals

6. **High Score Screen (Optional)**
   - Final score display
   - Difficulty level achieved
   - Play again option

**Optional: Add Text Overlays**
- "Sky Bird Dash" title
- "Difficulty: Easy/Medium/Hard"
- "Tap to fly!"
- "Avoid the obstacles!"

---

## Step 3: Google Play Store Setup

### Login to Google Play Console
1. Go to: https://play.google.com/console
2. Sign in with Google account
3. Click "Create app"

### Fill in Store Listing

**1. Basic Information:**
```
App name: Sky Bird Dash
Short description (80 characters max):
"Navigate through obstacles as a butterfly. 3 difficulty levels!"

Full description (4000 characters max):
See APP_STORE_METADATA.md for complete text
```

**2. Category & Content Rating:**
- Category: Games > Casual
- IARC Rating: Everyone (3+)
  - Content Rating Questionnaire: Fill out honestly
  - No violence, sexual content, etc.

**3. Graphics & Images:**

**App Icon** (512x512 pixels, PNG):
- Design a butterfly icon for "Sky Bird Dash"
- Include purple/blue cyberpunk colors
- Clear and recognizable

**Feature Graphic** (1024x500 pixels):
- Main game screenshot
- "Sky Bird Dash" title
- "Navigate the Skies" tagline
- Butterfly character

**Screenshots** (Required minimum: 2, recommended: 5-6):
- Same as iOS above
- Dimensions: 1080x1920 pixels minimum
- Portrait orientation

**Video Preview** (Optional):
- 15-30 second gameplay video
- Show all three difficulty levels
- Highlight unique features
- Upload to YouTube first, then link

**Promotional Graphic** (Optional):
- 1200x628 pixels
- Landscape orientation

**TV Banner** (Optional, if supporting TV):
- 1280x720 pixels

**4. Store Listing Details:**

**Title:** Sky Bird Dash

**Short Description:**
```
Navigate your butterfly through endless obstacles. 
Test your reflexes across 3 difficulty levels!
```

**Full Description:**
```
Sky Bird Dash - A Skill-Based Casual Game

Experience the thrill of Sky Bird Dash, an engaging casual 
flying game designed to challenge your reflexes and precision!

FEATURES:
✈️ Three Difficulty Levels:
   • Easy - Slower speed, wider gaps
   • Medium - Balanced challenge
   • Hard - Fast-paced mayhem

🎨 Stunning Visuals:
   • Cyberpunk-inspired purple and blue theme
   • Beautiful butterfly character
   • Smooth, optimized gameplay

🎮 Engaging Gameplay:
   • Simple tap-to-fly controls
   • Endless obstacle course
   • Track your high scores
   • Share with friends

HOW TO PLAY:
Tap to make your butterfly fly upward. Navigate through 
the pipes without hitting them. The longer you survive, 
the higher your score!

PERFECT FOR:
Quick gaming sessions during breaks or commutes. 
Try all three difficulty levels to master the game!

Download Sky Bird Dash now and start your aerial adventure! 🦋
```

**What's New in This Version:**
```
Complete rebranding to Sky Bird Dash!

✨ New Features:
• Three difficulty levels (Easy, Medium, Hard)
• Butterfly character with unique design
• Cyberpunk-inspired visual theme
• Enhanced UI and menu screens
• Optimized gameplay mechanics

🎮 Difficulty System:
• Easy: Perfect for learning the game
• Medium: Recommended standard experience
• Hard: Ultimate challenge for experts

🦋 Visual Enhancements:
• Purple and blue gradient backgrounds
• Smooth animations
• Professional UI design

Thank you for playing Sky Bird Dash! Your feedback helps us improve.
```

**Content Rating:**
- Violence: None
- Alcohol/Tobacco: None
- Gambling: None
- Sexual Content: None
- Advertising: None

**Privacy Policy URL:**
```
https://your-website.com/privacy
```

**Support URL:**
```
https://your-website.com/support
```

**Contact Email:**
```
[Your email]
```

---

## Step 4: Create Support & Privacy Pages

### Simple Privacy Policy Template

Create a page at `https://your-website.com/privacy`:

```
PRIVACY POLICY - Sky Bird Dash

Last Updated: May 14, 2026

1. INFORMATION WE COLLECT
Sky Bird Dash does NOT collect any personal information.
The app operates entirely offline and does not require
user accounts or data transmission.

2. DATA STORED
- Game progress and high scores are stored locally 
  on your device only
- No data is transmitted to external servers
- No user tracking or analytics

3. THIRD-PARTY SERVICES
This app uses the following third-party services:
- Firebase/Crashlytics (optional error reporting)
- Ads (if enabled)

See their privacy policies:
- Firebase: https://firebase.google.com/support/privacy
- [Ad Network]: [Link]

4. CHILDREN'S PRIVACY
Sky Bird Dash is suitable for children and complies 
with COPPA and similar regulations. We do not 
knowingly collect data from children under 13.

5. CONTACT US
For privacy questions, contact: [your-email@example.com]
```

### Simple Support Page Template

Create a page at `https://your-website.com/support`:

```
SUPPORT - Sky Bird Dash

Welcome to Sky Bird Dash Support!

GETTING STARTED

How do I play Sky Bird Dash?
- Tap to make your butterfly fly upward
- Navigate between the pipes
- Don't hit the obstacles!
- The longer you survive, the higher your score

DIFFICULTY LEVELS

What are the difficulty levels?
- EASY: Slower speed, wider gaps (great for learning)
- MEDIUM: Balanced challenge (recommended)
- HARD: Fast speed, narrow gaps (extreme challenge)

How do I change difficulty?
Return to the main menu and tap "TAP TO PLAY" again 
to select a different difficulty level.

TROUBLESHOOTING

The game is too slow/fast
Make sure you've selected the correct difficulty level.
Different difficulties have different speeds.

My high score disappeared
High scores are saved locally. If you reinstall the app,
your scores may be reset.

I found a bug or have feedback
Please contact us at: support@example.com

I'm stuck on a level
There are no levels in Sky Bird Dash! It's an endless game.
Focus on consistency and timing to achieve higher scores.

CONTACT US

For support, please email: support@example.com
Response time: Usually within 24-48 hours

Follow us on social media:
- Twitter: @SkyBirdDashGame
- Instagram: @SkyBirdDashGame
```

---

## Step 5: Final Checklist Before Submission

### Code & Build
- [ ] `flutter analyze` shows no critical errors
- [ ] `flutter clean && flutter pub get` completes successfully
- [ ] iOS build archives without errors
- [ ] Android App Bundle builds without errors
- [ ] Tested on iOS simulator
- [ ] Tested on Android emulator
- [ ] All three difficulty levels work correctly
- [ ] Game doesn't crash during gameplay
- [ ] No "FlappyBird" references remain

### Metadata
- [ ] App name: "Sky Bird Dash" everywhere
- [ ] No references to other games
- [ ] Keywords don't include "flappy" or "bird"
- [ ] Description is original and compelling
- [ ] Support URL works
- [ ] Privacy Policy URL works
- [ ] Contact email is correct

### Assets & Visuals
- [ ] All screenshots captured at correct resolution
- [ ] Screenshots show new UI and butterfly character
- [ ] Screenshots show all three difficulty levels
- [ ] App icon created (512x512)
- [ ] Feature graphic created (1024x500)
- [ ] No watermarks on screenshots
- [ ] Consistent branding across all assets

### Legal & Compliance
- [ ] Privacy policy reviewed and complete
- [ ] Content rating accurately reflects game
- [ ] No potentially infringing content
- [ ] Age rating set correctly (4+)
- [ ] Complies with Apple Guideline 4.1(a)
- [ ] Copyright/attribution correct

### Release Notes
- [ ] Release notes explain changes from previous version
- [ ] Release notes highlight new features
- [ ] Release notes are engaging and clear
- [ ] No spelling/grammar errors

---

## Step 6: Submit to App Store

### iOS App Store Connect

1. Go to: https://appstoreconnect.apple.com
2. Select your app
3. Click "Version 2.0.0" (or current)
4. Fill in all required fields (see Step 2)
5. Add screenshots
6. Add build:
   - Click "Build"
   - Wait for build processing
   - Select processed build
7. Fill in App Review Information:
   ```
   Notes for Review:
   "This is an original casual flying game featuring a 
   butterfly character navigating through obstacles. 
   The game includes three difficulty levels with 
   adjustable mechanics and a unique cyberpunk-inspired 
   visual theme. All assets, code, and design are 
   original creations. The gameplay mechanics have been 
   customized with difficulty scaling and unique 
   visual presentation."
   ```
8. Click "Submit for Review"
9. Wait for Apple's review (typically 24-48 hours)

### Google Play Store

1. Go to: https://play.google.com/console
2. Select your app
3. Click "Production" in left menu
4. Click "Create new release"
5. Add APK or App Bundle:
   - Click "Add"
   - Upload `build/app/outputs/bundle/release/app-release.aab`
6. Fill in release notes
7. Review all store listing information
8. Click "Review"
9. Click "Rollout to production" (or start with 10% rollout)
10. Wait for Google's review (typically 2-3 hours)

---

## Step 7: Post-Submission

### Monitor Reviews
- Check App Store reviews daily
- Respond to negative reviews professionally
- Fix bugs reported by users

### Update Version
After submission, prepare for next update:
- Version: 2.0.1 (if bug fixes)
- Version: 2.1.0 (if new features)
- Keep changelog updated

### Marketing
- Share on social media
- Get early reviewers
- Post on gaming forums
- Ask friends to leave reviews

---

## Common App Store Rejection Reasons & Fixes

### "References Third-Party Content"
✅ **Fixed:** All "Flappy Bird" references removed
✅ **Check:** No brand names in description/keywords

### "Misleading Screenshots"
✅ **Do:** Show actual gameplay and new UI
✅ **Don't:** Show other games or misleading features

### "Incomplete App Information"
✅ **Do:** Fill ALL required fields
✅ **Do:** Include working support/privacy URLs
✅ **Don't:** Leave fields blank

### "Doesn't Function as Described"
✅ **Do:** Test all features thoroughly
✅ **Do:** Make sure app matches description
✅ **Don't:** Claim features that don't work

### "Inappropriate Age Rating"
✅ **Do:** Rate honestly (4+ for this game)
✅ **Don't:** Rate too low to reach more users

---

## Contact Information

If Apple asks for more information, be prepared with:
- Original code repository (GitHub link)
- Development timeline
- Copyright/ownership proof
- Comparison of unique features
- Marketing materials

Say something like:
> "Sky Bird Dash is an original casual game featuring unique 
> difficulty levels and a butterfly character. While 
> inspired by the casual gaming genre, the game includes 
> custom mechanics, original visuals, and distinct branding 
> that differentiate it from other games in the category."

---

## Resources

- Apple App Store Guidelines: https://developer.apple.com/app-store/review/guidelines/
- Google Play Policies: https://play.google.com/about/developer-content-policy/
- Flutter Documentation: https://flutter.dev/docs
- App Store Connect Help: https://help.apple.com/app-store-connect/

---

Good luck with your submission! 🚀🦋

Remember: Following guidelines carefully the first time is much faster 
than dealing with rejections and resubmissions.
