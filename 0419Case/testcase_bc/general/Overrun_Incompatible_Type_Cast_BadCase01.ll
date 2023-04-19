; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/general/Overrun_Incompatible_Type_Cast_BadCase01.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/general/Overrun_Incompatible_Type_Cast_BadCase01.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestCaseBad01(i32* noundef %x) #0 !dbg !12 {
entry:
  %x.addr = alloca i32*, align 8
  store i32* %x, i32** %x.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %x.addr, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i32*, i32** %x.addr, align 8, !dbg !21
  store i32 60, i32* %0, align 4, !dbg !22
  ret void, !dbg !23
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @MyFunc1() #0 !dbg !24 {
entry:
  %y = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %y, metadata !27, metadata !DIExpression()), !dbg !28
  call void @TestCaseBad01(i32* noundef %y), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @MyFunc2() #0 !dbg !31 {
entry:
  %y = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %y, metadata !32, metadata !DIExpression()), !dbg !34
  %0 = bitcast i16* %y to i32*, !dbg !35
  call void @TestCaseBad01(i32* noundef %0), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @MyFunc3() #0 !dbg !38 {
entry:
  %y = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %y, metadata !39, metadata !DIExpression()), !dbg !40
  %0 = bitcast i16* %y to i32*, !dbg !41
  call void @TestCaseBad01(i32* noundef %0), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestCaseBad02(i32* noundef %p) #0 !dbg !44 {
entry:
  %p.addr = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %p.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %0 = load i32*, i32** %p.addr, align 8, !dbg !49
  store i32 10, i32* %0, align 4, !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @MyFunc4() #0 !dbg !52 {
entry:
  %a = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %a, metadata !53, metadata !DIExpression()), !dbg !54
  %0 = bitcast i16* %a to i32*, !dbg !55
  call void @TestCaseBad02(i32* noundef %0), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  ret i32 0, !dbg !61
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/general/Overrun_Incompatible_Type_Cast_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "TestCaseBad01", scope: !13, file: !13, line: 12, type: !14, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!13 = !DIFile(filename: "general/Overrun_Incompatible_Type_Cast_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!18 = !{}
!19 = !DILocalVariable(name: "x", arg: 1, scope: !12, file: !13, line: 12, type: !16)
!20 = !DILocation(line: 12, column: 34, scope: !12)
!21 = !DILocation(line: 15, column: 6, scope: !12)
!22 = !DILocation(line: 15, column: 8, scope: !12)
!23 = !DILocation(line: 16, column: 1, scope: !12)
!24 = distinct !DISubprogram(name: "MyFunc1", scope: !13, file: !13, line: 18, type: !25, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "y", scope: !24, file: !13, line: 20, type: !17)
!28 = !DILocation(line: 20, column: 18, scope: !24)
!29 = !DILocation(line: 21, column: 5, scope: !24)
!30 = !DILocation(line: 22, column: 1, scope: !24)
!31 = distinct !DISubprogram(name: "MyFunc2", scope: !13, file: !13, line: 25, type: !25, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!32 = !DILocalVariable(name: "y", scope: !31, file: !13, line: 27, type: !33)
!33 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 27, column: 20, scope: !31)
!35 = !DILocation(line: 29, column: 19, scope: !31)
!36 = !DILocation(line: 29, column: 5, scope: !31)
!37 = !DILocation(line: 30, column: 1, scope: !31)
!38 = distinct !DISubprogram(name: "MyFunc3", scope: !13, file: !13, line: 33, type: !25, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!39 = !DILocalVariable(name: "y", scope: !38, file: !13, line: 35, type: !33)
!40 = !DILocation(line: 35, column: 20, scope: !38)
!41 = !DILocation(line: 37, column: 19, scope: !38)
!42 = !DILocation(line: 37, column: 5, scope: !38)
!43 = !DILocation(line: 38, column: 1, scope: !38)
!44 = distinct !DISubprogram(name: "TestCaseBad02", scope: !13, file: !13, line: 44, type: !45, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!45 = !DISubroutineType(types: !46)
!46 = !{null, !3}
!47 = !DILocalVariable(name: "p", arg: 1, scope: !44, file: !13, line: 44, type: !3)
!48 = !DILocation(line: 44, column: 25, scope: !44)
!49 = !DILocation(line: 47, column: 6, scope: !44)
!50 = !DILocation(line: 47, column: 8, scope: !44)
!51 = !DILocation(line: 48, column: 1, scope: !44)
!52 = distinct !DISubprogram(name: "MyFunc4", scope: !13, file: !13, line: 50, type: !25, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!53 = !DILocalVariable(name: "a", scope: !52, file: !13, line: 52, type: !33)
!54 = !DILocation(line: 52, column: 20, scope: !52)
!55 = !DILocation(line: 54, column: 19, scope: !52)
!56 = !DILocation(line: 54, column: 5, scope: !52)
!57 = !DILocation(line: 55, column: 1, scope: !52)
!58 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 58, type: !59, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!59 = !DISubroutineType(types: !60)
!60 = !{!4}
!61 = !DILocation(line: 60, column: 5, scope: !58)
