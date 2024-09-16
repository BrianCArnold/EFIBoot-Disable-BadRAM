# EFI Memory Patch Utility for macOS 

**Currently the activation of this Utility needs a bit of effort. But if you put some effort into reading and understanding all the information, a lot of people can manage to get it working.** 

Are you experiencing system hangs or kernel panics on your Apple Mac or MacBook due to faulty memory? This EFI utility allows you to **disable defective memory regions** before macOS boots, preventing system crashes or unbootable Systems.

If you're receiving errors like:

- **PPM002, PPM003, PPM004...**: _"There may be an issue with the onboard memory."_

This utility offers a software solution by marking specific memory areas as defective, so macOS avoids them during runtime.

### Steps:
1. **Inform yourself**: Read through this README, [the Release-Notes](https://github.com/0nelight/macOS-Disable-RAM-Areas/releases/tag/v0.2.1-beta) and the [Discussions-Page](https://github.com/0nelight/macOS-Disable-RAM-Areas/discussions)
2. **Identify Faulty Memory**: Use diagnostic tools like [Memtest86+](https://www.memtest.org/) in Error-Summary-Mode to get the lowest and highest address of misbehaiving RAM.
3. **Run this EFI-Utility**: Use tools like [rEFInd](https://www.rodsbooks.com/refind/) to run this EFI-utility once before booting into macOS. This will mark the faulty RAM Area as unavailable for MacOS and therefore allowing a normal Operation of MacOs with only having a little bit less RAM.
4. **Boot MacOS**
5. **Automate Booting into MacOs with disabled RAM-Areas**: See [this Guide](https://github.com/0nelight/macOS-Disable-RAM-Areas/discussions/3).
4. **In case you have Questions not answered already - please open [a new Discussion](https://github.com/0nelight/macOS-Disable-RAM-Areas/discussions/new?category=q-a).**


## Disclaimer:
This utility is not affiliated with, authorized, endorsed by, or in any way officially connected to Apple Inc. The use of this software may affect the operation of your system, and it is provided as-is, without any express or implied warranties. This project is intended for personal use and is provided solely as a workaround for users experiencing issues with defective memory on their Apple Mac or MacBook. By using this utility, you acknowledge that Apple Inc. is not responsible for any consequences that may arise from its use, including but not limited to potential system instability or hardware failure.

## Important Note: Compatibility
This utility has been successfully in use for several years on an **MacBook Pro (Late 2013)** running **macOS Big Sur**. Please read the other Success-Stories on the [Issues-Page](https://github.com/0nelight/macOS-Disable-RAM-Areas/issues?q=label%3Asuccess+is%3Aclosed) or consider [writing one yourself](https://github.com/0nelight/macOS-Disable-RAM-Areas/issues/new?assignees=&labels=success&projects=&template=success-story.md&title=Success-Story) (please fill in your System Information) in case you found this Utility helpful.

## Motivation:
I see this as a great way to extend hardware lifespan, protect customer and shareholder value, and fight inflation by lowering demand for new devices, thus preserving the purchasing power of the dollar through more efficient resource use. 
Also such tools help keeping your soil and rivers less polluted from E-Waste and manufacturing waste material, which is good for your health and your health insurance.


## Why This Utility for Apple Mac and MacBook Users?
Many modern Apple devices, including Macs and MacBooks, come with memory chips soldered directly onto the motherboard. Replacing or reflowing these chips requires advanced tools and expertise, making hardware repair difficult and expensive.

This utility provides a **software-based workaround** by disabling defective memory blocks before macOS boots. It’s similar to the GNU GRUB `badram` command, but tailored for Apple hardware and macOS environments.

## Benefits:
- **No Costly Hardware Repair**: Solve memory-related issues without the need for expensive hardware repairs or professional services.
- **Extend the Life of Your Mac/MacBook**: Keep your Apple device running smoothly, even with defective memory regions.
- **Reduces E-Waste**: This tool extents the life of your Apple Computer and therefore reduces E-Waste.
---

ToDos (Contributions welcome!):
 - Testing with newer devices and newer macOs Versions
 - Provide better documentation (how to compile, "apt-get install gnu-efi")

## Some additonal Notes:

### Screenshot-from refind (instead of grubx64.efi you can have your DISABLE-RAM.EFI utility there):
![refind](https://github.com/user-attachments/assets/86a70d90-0975-4411-bf5b-49966757245d)

### The Place of this Utility within the Boot Process of a Mac:
![grafik](https://github.com/user-attachments/assets/2ee9237c-1e67-4339-aa63-3c1d718bb8ba)

### Documentation of AllocatePages-Function:
Documentation of this function: `gBS -> AllocatePages(2, 8, 40960, & Addr);` [efi-v1-10-specification.pdf](https://github.com/user-attachments/files/16910413/efi-v1-10-specification.pdf) Page: 119

### More Information on Mac-Internals:
https://eclecticlight.co/mac-troubleshooting-summary/

