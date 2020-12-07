import * as React from "react";
import type { MapTool } from "./map-tool";

type MarkAreaToolContextValue = {
  onMarkArea: (point: [number, number]) => void;
};

export const MarkAreaToolContext = React.createContext<MarkAreaToolContextValue>(
  // TODO: use context that throws if no value is provided
  undefined as any
);

export const MarkAreaMapTool: MapTool<{}, MarkAreaToolContextValue> = {
  id: "mark-area-map-tool",
  Context: MarkAreaToolContext,
  Component: (props) => {
    props.useMapGesture({
      onClick: () => {
        const position = props.mapContext.pointerPosition.get();
        props.contextState.onMarkArea(
          props.mapContext.helper.coordinates.canvasToImage(
            props.mapContext.helper.coordinates.threeToCanvas([
              position[0],
              position[1],
            ])
          )
        );
      },
    });
    return null;
  },
  createLocalState: () => ({}),
};
