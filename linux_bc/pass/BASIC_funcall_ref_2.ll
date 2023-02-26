; ModuleID = 'linux_bc/pass/BASIC_funcall_ref_2.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_funcall_ref_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo(i32* %p) #0 !dbg !9 {
entry:
  %p.addr = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %p.addr, metadata !15, metadata !DIExpression()), !dbg !16
  ret i32 0, !dbg !17
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !18 {
entry:
  %a = alloca i32, align 4
  %res = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %a, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %res, metadata !23, metadata !DIExpression()), !dbg !24
  %call = call i32 @foo(i32* %a), !dbg !25
  store i32 %call, i32* %res, align 4, !dbg !24
  %0 = load i32, i32* %res, align 4, !dbg !26
  %cmp = icmp eq i32 %0, 0, !dbg !27
  call void @svf_assert(i1 zeroext %cmp), !dbg !28
  ret i32 0, !dbg !29
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_funcall_ref_2.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_funcall_ref_2.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !14}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!15 = !DILocalVariable(name: "p", arg: 1, scope: !9, file: !10, line: 8, type: !14)
!16 = !DILocation(line: 8, column: 14, scope: !9)
!17 = !DILocation(line: 9, column: 3, scope: !9)
!18 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 12, type: !19, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!13}
!21 = !DILocalVariable(name: "a", scope: !18, file: !10, line: 13, type: !13)
!22 = !DILocation(line: 13, column: 9, scope: !18)
!23 = !DILocalVariable(name: "res", scope: !18, file: !10, line: 14, type: !13)
!24 = !DILocation(line: 14, column: 9, scope: !18)
!25 = !DILocation(line: 14, column: 15, scope: !18)
!26 = !DILocation(line: 15, column: 16, scope: !18)
!27 = !DILocation(line: 15, column: 20, scope: !18)
!28 = !DILocation(line: 15, column: 5, scope: !18)
!29 = !DILocation(line: 16, column: 1, scope: !18)
