#  Floating TabView
Feel free to use this as a base template to achieve a popout menu effect from the TabView.
<br>
If you wish to add a custom animation that includes an additional view (such as the blue view that appears when the Popout menu buttons appear or a slight blur for example) I have added some information in the FloatingCustomTabView.swift file.
<br>
<br>
### To consider: This TabView will work with 5 Views inclusive of the views on the TabView (not including the Popout menu button itself).<br><br>For example, a "Home", "Info" and "Settings" button on the TabView bar itself and then 2 additional buttons that appear when the Popout menu button is tapped ("New item" and "Privacy" for example) will work as expected.
<br>The TabView will only handle 5 views before returning unexpected results presenting as a "More" view, typically displayed when the TabItem count is greater than 5.
<!-- ![Example gif to show the floatng custom TabView.](Gifs/floatingTabViewGif.gif) -->
<img src="Gifs/floatingTabViewGif.gif" width="300" />
<br><br>
