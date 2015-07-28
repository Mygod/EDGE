using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Media.Animation;
using Mygod.Edge.Tool.LibTwoTribes;

namespace Mygod.Edge.Tool
{
    /// <summary>
    /// Cubic Hermite spline implementation.
    /// </summary>
    class TwoTribesAnimation : DoubleAnimationBase
    {
        public TwoTribesAnimation() { }
        public TwoTribesAnimation(KeyframeBlock block, double k = 1)
        {
            Block = block;
            K = k;
        }

        public static readonly DependencyProperty BlockProperty = DependencyProperty.Register("Block",
            typeof(KeyframeBlock), typeof(TwoTribesAnimation), new PropertyMetadata(null));
        public KeyframeBlock Block
        {
            get { return (KeyframeBlock)GetValue(BlockProperty); }
            set { SetValue(BlockProperty, value); }
        }
        public static readonly DependencyProperty KProperty = DependencyProperty.Register("K",
            typeof (double), typeof (TwoTribesAnimation), new PropertyMetadata(1D));
        public double K
        {
            get { return (double) GetValue(KProperty); }
            set { SetValue(KProperty, value); }
        }

        protected override Freezable CreateInstanceCore()
        {
            return new TwoTribesAnimation();
        }

        protected override double GetCurrentValueCore(double defaultOriginValue, double defaultDestinationValue,
                                                      AnimationClock animationClock)
        {
            Debug.Assert(animationClock.CurrentState != ClockState.Stopped);
            var block = Block;
            if (block == null) return defaultDestinationValue;
            if (!animationClock.CurrentTime.HasValue || block.Keyframes.Length <= 0) return K * block.DefaultValue;
            var currentFrame = animationClock.CurrentTime.Value.TotalSeconds * 30;
            int count = block.Keyframes.Length, i = 0;
            while (i < count && currentFrame >= block.Keyframes[i].Time) ++i;
            if (i >= count)
            {
                var frame = block.Keyframes[count - 1];
                return K * (frame.Value + frame.Velocity * (currentFrame - frame.Time));
            }
            var next = block.Keyframes[i];
            if (i <= 0 || Math.Abs(currentFrame - next.Time) < 1e-5)
                return K * (next.Value - next.Velocity * (next.Time - currentFrame));
            var previous = block.Keyframes[i - 1];
            double interval = next.Time - previous.Time, t = (currentFrame - previous.Time) / interval, t2 = t * t,
                   t3 = t2 * t, t22 = t2 + t2;
            return (previous.Value + (t3 + t3 - t22 - t2) * (previous.Value - next.Value) +
                   ((t3 - t22 + t) * previous.Velocity + (t3 - t2) * next.Velocity) * interval) * K;
        }
    }
}
