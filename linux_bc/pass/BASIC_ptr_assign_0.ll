; ModuleID = 'linux_bc/pass/BASIC_ptr_assign_0.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_ptr_assign_0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %p = alloca i32*, align 8
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32** %p, metadata !14, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %a, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 1, i32* %a, align 4, !dbg !18
  store i32* %a, i32** %p, align 8, !dbg !19
  %0 = load i32*, i32** %p, align 8, !dbg !20
  store i32 3, i32* %0, align 4, !dbg !21
  %1 = load i32, i32* %a, align 4, !dbg !22
  %cmp = icmp eq i32 %1, 3, !dbg !23
  call void @svf_assert(i1 zeroext %cmp), !dbg !24
  ret i32 0, !dbg !25
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_ptr_assign_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 9, type: !11, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_ptr_assign_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "p", scope: !9, file: !10, line: 10, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!16 = !DILocation(line: 10, column: 10, scope: !9)
!17 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 11, type: !13)
!18 = !DILocation(line: 11, column: 9, scope: !9)
!19 = !DILocation(line: 12, column: 7, scope: !9)
!20 = !DILocation(line: 13, column: 6, scope: !9)
!21 = !DILocation(line: 13, column: 8, scope: !9)
!22 = !DILocation(line: 14, column: 16, scope: !9)
!23 = !DILocation(line: 14, column: 18, scope: !9)
!24 = !DILocation(line: 14, column: 5, scope: !9)
!25 = !DILocation(line: 15, column: 1, scope: !9)
