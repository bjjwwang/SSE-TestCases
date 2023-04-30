; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/function/Overlapping_Copy_Memory_Copy_BadCase06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/Overlapping_Copy_Memory_Copy_BadCase06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.S1 = type { i32 }
%struct.S2 = type { i64 }

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestBad6(i8* noundef %p) #0 !dbg !22 {
entry:
  %p.addr = alloca i8*, align 8
  %s1 = alloca %struct.S1*, align 8
  %s2 = alloca %struct.S2*, align 8
  store i8* %p, i8** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %p.addr, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata %struct.S1** %s1, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = load i8*, i8** %p.addr, align 8, !dbg !30
  %1 = bitcast i8* %0 to %struct.S1*, !dbg !31
  store %struct.S1* %1, %struct.S1** %s1, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata %struct.S2** %s2, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = load i8*, i8** %p.addr, align 8, !dbg !34
  %3 = bitcast i8* %2 to %struct.S2*, !dbg !35
  store %struct.S2* %3, %struct.S2** %s2, align 8, !dbg !33
  %4 = load %struct.S1*, %struct.S1** %s1, align 8, !dbg !36
  %i = getelementptr inbounds %struct.S1, %struct.S1* %4, i32 0, i32 0, !dbg !37
  %5 = load i32, i32* %i, align 4, !dbg !37
  %conv = sext i32 %5 to i64, !dbg !36
  %6 = load %struct.S2*, %struct.S2** %s2, align 8, !dbg !38
  %l = getelementptr inbounds %struct.S2, %struct.S2* %6, i32 0, i32 0, !dbg !39
  store i64 %conv, i64* %l, align 8, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !42 {
entry:
  %p = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %p, metadata !45, metadata !DIExpression()), !dbg !46
  store i32 3456, i32* %p, align 4, !dbg !46
  %0 = bitcast i32* %p to i8*, !dbg !47
  call void @TestBad6(i8* noundef %0), !dbg !48
  ret i32 0, !dbg !49
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/Overlapping_Copy_Memory_Copy_BadCase06-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{!3, !9, !14}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "S1", file: !5, line: 5, size: 32, elements: !6)
!5 = !DIFile(filename: "function/Overlapping_Copy_Memory_Copy_BadCase06-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!6 = !{!7}
!7 = !DIDerivedType(tag: DW_TAG_member, name: "i", scope: !4, file: !5, line: 6, baseType: !8, size: 32)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "S2", file: !5, line: 9, size: 64, elements: !11)
!11 = !{!12}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "l", scope: !10, file: !5, line: 10, baseType: !13, size: 64)
!13 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"Homebrew clang version 14.0.6"}
!22 = distinct !DISubprogram(name: "TestBad6", scope: !5, file: !5, line: 17, type: !23, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !25)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !14}
!25 = !{}
!26 = !DILocalVariable(name: "p", arg: 1, scope: !22, file: !5, line: 17, type: !14)
!27 = !DILocation(line: 17, column: 21, scope: !22)
!28 = !DILocalVariable(name: "s1", scope: !22, file: !5, line: 19, type: !3)
!29 = !DILocation(line: 19, column: 16, scope: !22)
!30 = !DILocation(line: 19, column: 34, scope: !22)
!31 = !DILocation(line: 19, column: 21, scope: !22)
!32 = !DILocalVariable(name: "s2", scope: !22, file: !5, line: 20, type: !9)
!33 = !DILocation(line: 20, column: 16, scope: !22)
!34 = !DILocation(line: 20, column: 34, scope: !22)
!35 = !DILocation(line: 20, column: 21, scope: !22)
!36 = !DILocation(line: 22, column: 13, scope: !22)
!37 = !DILocation(line: 22, column: 17, scope: !22)
!38 = !DILocation(line: 22, column: 5, scope: !22)
!39 = !DILocation(line: 22, column: 9, scope: !22)
!40 = !DILocation(line: 22, column: 11, scope: !22)
!41 = !DILocation(line: 23, column: 1, scope: !22)
!42 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 25, type: !43, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !25)
!43 = !DISubroutineType(types: !44)
!44 = !{!8}
!45 = !DILocalVariable(name: "p", scope: !42, file: !5, line: 26, type: !8)
!46 = !DILocation(line: 26, column: 9, scope: !42)
!47 = !DILocation(line: 27, column: 14, scope: !42)
!48 = !DILocation(line: 27, column: 5, scope: !42)
!49 = !DILocation(line: 28, column: 1, scope: !42)
