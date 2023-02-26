; ModuleID = 'linux_bc/pass/BASIC_ptr_call2.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_ptr_call2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %y = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %y, metadata !14, metadata !DIExpression()), !dbg !15
  %call = call i32 @c(i32 2), !dbg !16
  store i32 %call, i32* %y, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %x, metadata !17, metadata !DIExpression()), !dbg !18
  %call1 = call i32 @c(i32 3), !dbg !19
  store i32 %call1, i32* %x, align 4, !dbg !18
  %0 = load i32, i32* %x, align 4, !dbg !20
  %cmp = icmp eq i32 %0, 3, !dbg !21
  call void @svf_assert(i1 zeroext %cmp), !dbg !22
  ret i32 0, !dbg !23
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @c(i32 %z) #0 !dbg !24 {
entry:
  %z.addr = alloca i32, align 4
  store i32 %z, i32* %z.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %z.addr, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* %z.addr, align 4, !dbg !29
  ret i32 %0, !dbg !30
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_ptr_call2.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_ptr_call2.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 10, type: !13)
!15 = !DILocation(line: 10, column: 7, scope: !9)
!16 = !DILocation(line: 10, column: 11, scope: !9)
!17 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 11, type: !13)
!18 = !DILocation(line: 11, column: 7, scope: !9)
!19 = !DILocation(line: 11, column: 11, scope: !9)
!20 = !DILocation(line: 13, column: 14, scope: !9)
!21 = !DILocation(line: 13, column: 15, scope: !9)
!22 = !DILocation(line: 13, column: 3, scope: !9)
!23 = !DILocation(line: 15, column: 3, scope: !9)
!24 = distinct !DISubprogram(name: "c", scope: !10, file: !10, line: 18, type: !25, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{!13, !13}
!27 = !DILocalVariable(name: "z", arg: 1, scope: !24, file: !10, line: 18, type: !13)
!28 = !DILocation(line: 18, column: 11, scope: !24)
!29 = !DILocation(line: 18, column: 22, scope: !24)
!30 = !DILocation(line: 18, column: 15, scope: !24)
