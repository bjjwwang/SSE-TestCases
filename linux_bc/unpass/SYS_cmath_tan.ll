; ModuleID = 'linux_bc/unpass/SYS_cmath_tan.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/unpass/SYS_cmath_tan.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %param = alloca double, align 8
  %result = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata double* %param, metadata !14, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata double* %result, metadata !17, metadata !DIExpression()), !dbg !18
  store double 4.500000e+01, double* %param, align 8, !dbg !19
  %0 = load double, double* %param, align 8, !dbg !20
  %mul = fmul double %0, 0x400921FB53C8D4F1, !dbg !21
  %div = fdiv double %mul, 1.800000e+02, !dbg !22
  %call = call double @tan(double %div) #4, !dbg !23
  store double %call, double* %result, align 8, !dbg !24
  %1 = load double, double* %result, align 8, !dbg !25
  %sub = fsub double %1, 1.000000e+00, !dbg !26
  %cmp = fcmp olt double %sub, 1.000000e-02, !dbg !27
  call void @svf_assert(i1 zeroext %cmp), !dbg !28
  ret i32 0, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @tan(double) #2

declare dso_local void @svf_assert(i1 zeroext) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/unpass/SYS_cmath_tan.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/unpass/SYS_cmath_tan.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "param", scope: !9, file: !10, line: 9, type: !15)
!15 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!16 = !DILocation(line: 9, column: 12, scope: !9)
!17 = !DILocalVariable(name: "result", scope: !9, file: !10, line: 9, type: !15)
!18 = !DILocation(line: 9, column: 19, scope: !9)
!19 = !DILocation(line: 10, column: 11, scope: !9)
!20 = !DILocation(line: 11, column: 20, scope: !9)
!21 = !DILocation(line: 11, column: 26, scope: !9)
!22 = !DILocation(line: 11, column: 31, scope: !9)
!23 = !DILocation(line: 11, column: 14, scope: !9)
!24 = !DILocation(line: 11, column: 12, scope: !9)
!25 = !DILocation(line: 12, column: 16, scope: !9)
!26 = !DILocation(line: 12, column: 23, scope: !9)
!27 = !DILocation(line: 12, column: 29, scope: !9)
!28 = !DILocation(line: 12, column: 5, scope: !9)
!29 = !DILocation(line: 13, column: 5, scope: !9)
