; ModuleID = 'mac_bc/unpass/SYS_cmath_cos.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/unpass/SYS_cmath_cos.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %param = alloca double, align 8
  %result = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata double* %param, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata double* %result, metadata !18, metadata !DIExpression()), !dbg !19
  store double 6.000000e+01, double* %param, align 8, !dbg !20
  %0 = load double, double* %param, align 8, !dbg !21
  %mul = fmul double %0, 0x400921FB53C8D4F1, !dbg !22
  %div = fdiv double %mul, 1.800000e+02, !dbg !23
  %1 = call double @llvm.cos.f64(double %div), !dbg !24
  store double %1, double* %result, align 8, !dbg !25
  %2 = load double, double* %result, align 8, !dbg !26
  %sub = fsub double %2, 5.000000e-01, !dbg !27
  %cmp = fcmp olt double %sub, 1.000000e-03, !dbg !28
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !29
  ret i32 0, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.cos.f64(double) #1

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/unpass/SYS_cmath_cos.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/unpass/SYS_cmath_cos.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "param", scope: !9, file: !10, line: 9, type: !16)
!16 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!17 = !DILocation(line: 9, column: 12, scope: !9)
!18 = !DILocalVariable(name: "result", scope: !9, file: !10, line: 9, type: !16)
!19 = !DILocation(line: 9, column: 19, scope: !9)
!20 = !DILocation(line: 10, column: 11, scope: !9)
!21 = !DILocation(line: 11, column: 20, scope: !9)
!22 = !DILocation(line: 11, column: 26, scope: !9)
!23 = !DILocation(line: 11, column: 31, scope: !9)
!24 = !DILocation(line: 11, column: 14, scope: !9)
!25 = !DILocation(line: 11, column: 12, scope: !9)
!26 = !DILocation(line: 12, column: 16, scope: !9)
!27 = !DILocation(line: 12, column: 23, scope: !9)
!28 = !DILocation(line: 12, column: 30, scope: !9)
!29 = !DILocation(line: 12, column: 5, scope: !9)
!30 = !DILocation(line: 13, column: 5, scope: !9)
