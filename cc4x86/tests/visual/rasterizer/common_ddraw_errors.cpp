
#include <ddraw.h>
#include "common_ddraw_error.h"


const char *ddraw_describe_error(HRESULT ddrval)
{
    switch (ddrval) {
    case DD_OK:
        return  "The request completed successfully.";


    case DDERR_ALREADYINITIALIZED:
        return  "The object has already been initialized.";

    case DDERR_BLTFASTCANTCLIP:
        return  "A DirectDrawClipper object is attached to a source surface t"
                "hat has passed into a call to the IDirectDrawSurface7::BltFa"
                "st method.";

    case DDERR_CANNOTATTACHSURFACE:
        return  "A surface cannot be attached to another requested surface.";

    case DDERR_CANNOTDETACHSURFACE:
        return  "A surface cannot be detached from another requested surface.";

    case DDERR_CANTCREATEDC:
        return  "Windows cannot create any more device contexts (DCs), or a D"
                "C has requested a palette-indexed surface when the surface h"
                "ad no palette and the display mode was not palette-indexed ("
                "in this case DirectDraw cannot select a proper palette into "
                "the DC).";

    case DDERR_CANTDUPLICATE:
        return  "Primary and 3-D surfaces, or surfaces that are implicitly cr"
                "eated, cannot be duplicated.";

    case DDERR_CANTLOCKSURFACE:
        return  "Access to this surface is refused because an attempt was mad"
                "e to lock the primary surface without DCI support.";

    case DDERR_CANTPAGELOCK:
        return  "An attempt to page-lock a surface failed. Page lock does not"
                " work on a display-memory surface or an emulated primary sur"
                "face.";

    case DDERR_CANTPAGEUNLOCK:
        return  "An attempt to page-unlock a surface failed. Page unlock does"
                " not work on a display-memory surface or an emulated primary"
                " surface.";

    case DDERR_CLIPPERISUSINGHWND:
        return  "An attempt was made to set a clip list for a DirectDrawClipp"
                "er object that is already monitoring a window handle.";

    case DDERR_COLORKEYNOTSET:
        return  "No source color key is specified for this operation.";

    case DDERR_CURRENTLYNOTAVAIL:
        return  "No support is currently available.";

    case DDERR_DDSCAPSCOMPLEXREQUIRED:
        return  "New for DirectX 7.0. The surface requires the DDSCAPS_COMPLE"
                "X flag.";

    case DDERR_DCALREADYCREATED:
        return  "A device context (DC) has already been returned for this sur"
                "face. Only one DC can be retrieved for each surface.";

    case DDERR_DEVICEDOESNTOWNSURFACE:
        return  "Surfaces created by one DirectDraw device cannot be used dir"
                "ectly by another DirectDraw device.";

    case DDERR_DIRECTDRAWALREADYCREATED:
        return  "A DirectDraw object representing this driver has already bee"
                "n created for this process.";

    case DDERR_EXCEPTION:
        return  "An exception was encountered while performing the requested "
                "operation.";

    case DDERR_EXCLUSIVEMODEALREADYSET:
        return  "An attempt was made to set the cooperative level when it was"
                " already set to exclusive.";

    case DDERR_EXPIRED:
        return  "The data has expired and is therefore no longer valid.";

    case DDERR_GENERIC:
        return  "There is an undefined error condition.";

    case DDERR_HEIGHTALIGN:
        return  "The height of the provided rectangle is not a multiple of th"
                "e required alignment.";

    case DDERR_HWNDALREADYSET:
        return  "The DirectDraw cooperative-level window handle has already b"
                "een set. It cannot be reset while the process has surfaces o"
                "r palettes created.";

    case DDERR_HWNDSUBCLASSED:
        return  "DirectDraw is prevented from restoring state because the Dir"
                "ectDraw cooperative-level window handle has been subclassed.";

    case DDERR_IMPLICITLYCREATED:
        return  "The surface cannot be restored because it is an implicitly c"
                "reated surface.";

    case DDERR_INCOMPATIBLEPRIMARY:
        return  "The primary surface creation request does not match the exis"
                "ting primary surface.";

    case DDERR_INVALIDCAPS:
        return  "One or more of the capability bits passed to the callback fu"
                "nction are incorrect.";

    case DDERR_INVALIDCLIPLIST:
        return  "DirectDraw does not support the provided clip list.";

    case DDERR_INVALIDDIRECTDRAWGUID:
        return  "The globally unique identifier (GUID) passed to the DirectDr"
                "awCreate function is not a valid DirectDraw driver identifie"
                "r.";

    case DDERR_INVALIDMODE:
        return  "DirectDraw does not support the requested mode.";

    case DDERR_INVALIDOBJECT:
        return  "DirectDraw received a pointer that was an invalid DirectDraw"
                " object.";

    case DDERR_INVALIDPARAMS:
        return  "One or more of the parameters passed to the method are incor"
                "rect.";

    case DDERR_INVALIDPIXELFORMAT:
        return  "The pixel format was invalid as specified.";

    case DDERR_INVALIDPOSITION:
        return  "The position of the overlay on the destination is no longer "
                "legal.";

    case DDERR_INVALIDRECT:
        return  "The provided rectangle was invalid.";

    case DDERR_INVALIDSTREAM:
        return  "The specified stream contains invalid data.";

    case DDERR_INVALIDSURFACETYPE:
        return  "The surface was of the wrong type.";

    case DDERR_LOCKEDSURFACES:
        return  "One or more surfaces are locked, causing the failure of the "
                "requested operation.";

    case DDERR_MOREDATA:
        return  "There is more data available than the specified buffer size "
                "can hold.";

    case DDERR_NEWMODE:
        return  "New for DirectX 7.0. When IDirectDraw7::StartModeTest is cal"
                "led with the DDSMT_ISTESTREQUIRED flag, it may return this v"
                "alue to denote that some or all of the resolutions can and s"
                "hould be tested. IDirectDraw7::EvaluateMode returns this val"
                "ue to indicate that the test has switched to a new display m"
                "ode.";

    case DDERR_NO3D:
        return  "No 3-D hardware or emulation is present.";

    case DDERR_NOALPHAHW:
        return  "No alpha-acceleration hardware is present or available, caus"
                "ing the failure of the requested operation.";

    case DDERR_NOBLTHW:
        return  "No blitter hardware is present.";

    case DDERR_NOCLIPLIST:
        return  "No clip list is available.";

    case DDERR_NOCLIPPERATTACHED:
        return  "No DirectDrawClipper object is attached to the surface objec"
                "t.";

    case DDERR_NOCOLORCONVHW:
        return  "No color-conversion hardware is present or available.";

    case DDERR_NOCOLORKEY:
        return  "The surface does not currently have a color key.";

    case DDERR_NOCOLORKEYHW:
        return  "There is no hardware support for the destination color key.";

    case DDERR_NOCOOPERATIVELEVELSET:
        return  "A create function was called without the IDirectDraw7::SetCo"
                "operativeLevel method.";

    case DDERR_NODC:
        return  "No device context (DC) has ever been created for this surfac"
                "e.";

    case DDERR_NODDROPSHW:
        return  "No DirectDraw raster-operation (ROP) hardware is available.";

    case DDERR_NODIRECTDRAWHW:
        return  "Hardware-only DirectDraw object creation is not possible; th"
                "e driver does not support any hardware.";

    case DDERR_NODIRECTDRAWSUPPORT:
        return  "DirectDraw support is not possible with the current display "
                "driver.";

    case DDERR_NODRIVERSUPPORT:
        return  "New for DirectX 7.0. Testing cannot proceed because the disp"
                "lay adapter driver does not enumerate refresh rates.";

    case DDERR_NOEMULATION:
        return  "Software emulation is not available.";

    case DDERR_NOEXCLUSIVEMODE:
        return  "The operation requires the application to have exclusive mod"
                "e, but the application does not have exclusive mode.";

    case DDERR_NOFLIPHW:
        return  "Flipping visible surfaces is not supported.";

    case DDERR_NOFOCUSWINDOW:
        return  "An attempt was made to create or set a device window without"
                " first setting the focus window.";

    case DDERR_NOGDI:
        return  "No GDI is present.";

    case DDERR_NOHWND:
        return  "Clipper notification requires a window handle, or no window "
                "handle has been previously set as the cooperative level wind"
                "ow handle.";

    case DDERR_NOMIPMAPHW:
        return  "No mipmap-capable texture mapping hardware is present or ava"
                "ilable.";

    case DDERR_NOMIRRORHW:
        return  "No mirroring hardware is present or available.";

    case DDERR_NOMONITORINFORMATION:
        return  "New for DirectX 7.0. Testing cannot proceed because the moni"
                "tor has no associated EDID data.";

    case DDERR_NONONLOCALVIDMEM:
        return  "An attempt was made to allocate nonlocal video memory from a"
                " device that does not support nonlocal video memory.";

    case DDERR_NOOPTIMIZEHW:
        return  "The device does not support optimized surfaces.";

    case DDERR_NOOVERLAYDEST:
        return  "The IDirectDrawSurface7::GetOverlayPosition method is called"
                " on an overlay that the IDirectDrawSurface7::UpdateOverlay m"
                "ethod has not been called on to establish as a destination.";

    case DDERR_NOOVERLAYHW:
        return  "No overlay hardware is present or available.";

    case DDERR_NOPALETTEATTACHED:
        return  "No palette object is attached to this surface.";

    case DDERR_NOPALETTEHW:
        return  "There is no hardware support for 16- or 256-color palettes.";

    case DDERR_NORASTEROPHW:
        return  "No appropriate raster-operation hardware is present or avail"
                "able.";

    case DDERR_NOROTATIONHW:
        return  "No rotation hardware is present or available.";

    case DDERR_NOSTEREOHARDWARE:
        return  "There is no stereo hardware present or available.";

    case DDERR_NOSTRETCHHW:
        return  "There is no hardware support for stretching.";

    case DDERR_NOSURFACELEFT:
        return  "There is no hardware present that supports stereo surfaces.";

    case DDERR_NOT4BITCOLOR:
        return  "The DirectDrawSurface object is not using a 4-bit color pale"
                "tte, and the requested operation requires a 4-bit color pale"
                "tte.";

    case DDERR_NOT4BITCOLORINDEX:
        return  "The DirectDrawSurface object is not using a 4-bit color inde"
                "x palette, and the requested operation requires a 4-bit colo"
                "r index palette.";

    case DDERR_NOT8BITCOLOR:
        return  "The DirectDrawSurface object is not using an 8-bit color pal"
                "ette, and the requested operation requires an 8-bit color pa"
                "lette.";

    case DDERR_NOTAOVERLAYSURFACE:
        return  "An overlay component is called for a nonoverlay surface.";

    case DDERR_NOTEXTUREHW:
        return  "The operation cannot be carried out because no texture-mappi"
                "ng hardware is present or available.";

    case DDERR_NOTFLIPPABLE:
        return  "An attempt was made to flip a surface that cannot be flipped"
                ".";

    case DDERR_NOTFOUND:
        return  "The requested item was not found.";

    case DDERR_NOTINITIALIZED:
        return  "An attempt was made to call an interface method of a DirectD"
                "raw object created by CoCreateInstance before the object was"
                " initialized.";

    case DDERR_NOTLOADED:
        return  "The surface is an optimized surface, but it has not yet been"
                " allocated any memory.";

    case DDERR_NOTLOCKED:
        return  "An attempt was made to unlock a surface that was not locked.";

    case DDERR_NOTPAGELOCKED:
        return  "An attempt was made to page-unlock a surface with no outstan"
                "ding page locks.";

    case DDERR_NOTPALETTIZED:
        return  "The surface being used is not a palette-based surface.";

    case DDERR_NOVSYNCHW:
        return  "There is no hardware support for vertical blank-synchronized"
                " operations.";

    case DDERR_NOZBUFFERHW:
        return  "The operation to create a z-buffer in display memory or to p"
                "erform a blit, using a z-buffer cannot be carried out becaus"
                "e there is no hardware support for z-buffers.";

    case DDERR_NOZOVERLAYHW:
        return  "The overlay surfaces cannot be z-layered, based on the z-ord"
                "er because the hardware does not support z-ordering of overl"
                "ays.";

    case DDERR_OUTOFCAPS:
        return  "The hardware needed for the requested operation has already "
                "been allocated.";

    case DDERR_OUTOFMEMORY:
        return  "DirectDraw does not have enough memory to perform the operat"
                "ion.";

    case DDERR_OUTOFVIDEOMEMORY:
        return  "DirectDraw does not have enough display memory to perform th"
                "e operation.";

    case DDERR_OVERLAPPINGRECTS:
        return  "The source and destination rectangles are on the same surfac"
                "e and overlap each other.";

    case DDERR_OVERLAYCANTCLIP:
        return  "The hardware does not support clipped overlays.";

    case DDERR_OVERLAYCOLORKEYONLYONEACTIVE:
        return  "An attempt was made to have more than one color key active o"
                "n an overlay.";

    case DDERR_OVERLAYNOTVISIBLE:
        return  "The IDirectDrawSurface7::GetOverlayPosition method was calle"
                "d on a hidden overlay.";

    case DDERR_PALETTEBUSY:
        return  "Access to this palette is refused because the palette is loc"
                "ked by another thread.";

    case DDERR_PRIMARYSURFACEALREADYEXISTS:
        return  "This process has already created a primary surface.";

    case DDERR_REGIONTOOSMALL:
        return  "The region passed to the IDirectDrawClipper::GetClipList met"
                "hod is too small.";

    case DDERR_SURFACEALREADYATTACHED:
        return  "An attempt was made to attach a surface to another surface t"
                "o which it is already attached.";

    case DDERR_SURFACEALREADYDEPENDENT:
        return  "An attempt was made to make a surface a dependency of anothe"
                "r surface on which it is already dependent.";

    case DDERR_SURFACEBUSY:
        return  "Access to the surface is refused because the surface is lock"
                "ed by another thread.";

    case DDERR_SURFACEISOBSCURED:
        return  "Access to the surface is refused because the surface is obsc"
                "ured.";

    case DDERR_SURFACELOST:
        return  "Access to the surface is refused because the surface memory "
                "is gone. Call the IDirectDrawSurface7::Restore method on thi"
                "s surface to restore the memory associated with it.";

    case DDERR_SURFACENOTATTACHED:
        return  "The requested surface is not attached.";

    case DDERR_TESTFINISHED:
        return  "New for DirectX 7.0. When returned by the IDirectDraw7::Star"
                "tModeTest method, this value means that no test could be ini"
                "tiated because all the resolutions chosen for testing alread"
                "y have refresh rate information in the registry. When return"
                "ed by IDirectDraw7::EvaluateMode, the value means that Direc"
                "tDraw has completed a refresh rate test.";

    case DDERR_TOOBIGHEIGHT:
        return  "The height requested by DirectDraw is too large.";

    case DDERR_TOOBIGSIZE:
        return  "The size requested by DirectDraw is too large. However, the "
                "individual height and width are valid sizes.";

    case DDERR_TOOBIGWIDTH:
        return  "The width requested by DirectDraw is too large.";

    case DDERR_UNSUPPORTED:
        return  "The operation is not supported.";

    case DDERR_UNSUPPORTEDFORMAT:
        return  "The pixel format requested is not supported by DirectDraw.";

    case DDERR_UNSUPPORTEDMASK:
        return  "The bitmask in the pixel format requested is not supported b"
                "y DirectDraw.";

    case DDERR_UNSUPPORTEDMODE:
        return  "The display is currently in an unsupported mode.";

    case DDERR_VERTICALBLANKINPROGRESS:
        return  "A vertical blank is in progress.";

    case DDERR_VIDEONOTACTIVE:
        return  "The video port is not active.";

    case DDERR_WASSTILLDRAWING:
        return  "The previous blit operation that is transferring information"
                " to or from this surface is incomplete.";

    case DDERR_WRONGMODE:
        return  "This surface cannot be restored because it was created in a "
                "different mode.";

    case DDERR_XALIGN:
        return  "The provided rectangle was not horizontally aligned on a req"
                "uired boundary.";

    default:
        return  "Unknown or invalid error code specified.";
    }
}
