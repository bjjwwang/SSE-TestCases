; ModuleID = 'mac_bc/pass/INTERVAL_test_57.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_57.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @a(i32 noundef %x) #0 !dbg !9 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32, i32* %x.addr, align 4, !dbg !17
  %call = call i32 @b(i32 noundef %0), !dbg !18
  %mul = mul nsw i32 %call, 2, !dbg !19
  ret i32 %mul, !dbg !20
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @b(i32 noundef %x) #0 !dbg !21 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i32, i32* %x.addr, align 4, !dbg !24
  %call = call i32 @c(i32 noundef %0), !dbg !25
  %mul = mul nsw i32 %call, 2, !dbg !26
  ret i32 %mul, !dbg !27
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @c(i32 noundef %x) #0 !dbg !28 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = load i32, i32* %x.addr, align 4, !dbg !31
  %call = call i32 @d(i32 noundef %0), !dbg !32
  %mul = mul nsw i32 %call, 2, !dbg !33
  ret i32 %mul, !dbg !34
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @d(i32 noundef %x) #0 !dbg !35 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i32, i32* %x.addr, align 4, !dbg !38
  %call = call i32 @e(i32 noundef %0), !dbg !39
  %mul = mul nsw i32 %call, 2, !dbg !40
  ret i32 %mul, !dbg !41
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @e(i32 noundef %x) #0 !dbg !42 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !43, metadata !DIExpression()), !dbg !44
  %0 = load i32, i32* %x.addr, align 4, !dbg !45
  %call = call i32 @f(i32 noundef %0), !dbg !46
  %mul = mul nsw i32 %call, 2, !dbg !47
  ret i32 %mul, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @f(i32 noundef %x) #0 !dbg !49 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %0 = load i32, i32* %x.addr, align 4, !dbg !52
  %call = call i32 @g(i32 noundef %0), !dbg !53
  %mul = mul nsw i32 %call, 2, !dbg !54
  ret i32 %mul, !dbg !55
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @g(i32 noundef %x) #0 !dbg !56 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* %x.addr, align 4, !dbg !59
  %call = call i32 @h(i32 noundef %0), !dbg !60
  %mul = mul nsw i32 %call, 2, !dbg !61
  ret i32 %mul, !dbg !62
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @h(i32 noundef %x) #0 !dbg !63 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i32, i32* %x.addr, align 4, !dbg !66
  %call = call i32 @z(i32 noundef %0), !dbg !67
  %mul = mul nsw i32 %call, 2, !dbg !68
  ret i32 %mul, !dbg !69
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @z(i32 noundef %x) #0 !dbg !70 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = load i32, i32* %x.addr, align 4, !dbg !73
  %mul = mul nsw i32 %0, 2, !dbg !74
  ret i32 %mul, !dbg !75
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !76 {
entry:
  %input = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %input, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32* %result, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = load i32, i32* %input, align 4, !dbg !83
  %call = call i32 @a(i32 noundef %0), !dbg !84
  store i32 %call, i32* %result, align 4, !dbg !82
  %1 = load i32, i32* %result, align 4, !dbg !85
  %2 = load i32, i32* %input, align 4, !dbg !86
  %mul = mul nsw i32 %2, 512, !dbg !87
  %cmp = icmp eq i32 %1, %mul, !dbg !88
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !89
  ret i32 0, !dbg !90
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_57.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "a", scope: !10, file: !10, line: 18, type: !11, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_57.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "x", arg: 1, scope: !9, file: !10, line: 18, type: !13)
!16 = !DILocation(line: 18, column: 11, scope: !9)
!17 = !DILocation(line: 19, column: 11, scope: !9)
!18 = !DILocation(line: 19, column: 9, scope: !9)
!19 = !DILocation(line: 19, column: 14, scope: !9)
!20 = !DILocation(line: 19, column: 2, scope: !9)
!21 = distinct !DISubprogram(name: "b", scope: !10, file: !10, line: 22, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!22 = !DILocalVariable(name: "x", arg: 1, scope: !21, file: !10, line: 22, type: !13)
!23 = !DILocation(line: 22, column: 11, scope: !21)
!24 = !DILocation(line: 23, column: 11, scope: !21)
!25 = !DILocation(line: 23, column: 9, scope: !21)
!26 = !DILocation(line: 23, column: 14, scope: !21)
!27 = !DILocation(line: 23, column: 2, scope: !21)
!28 = distinct !DISubprogram(name: "c", scope: !10, file: !10, line: 26, type: !11, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!29 = !DILocalVariable(name: "x", arg: 1, scope: !28, file: !10, line: 26, type: !13)
!30 = !DILocation(line: 26, column: 11, scope: !28)
!31 = !DILocation(line: 27, column: 11, scope: !28)
!32 = !DILocation(line: 27, column: 9, scope: !28)
!33 = !DILocation(line: 27, column: 14, scope: !28)
!34 = !DILocation(line: 27, column: 2, scope: !28)
!35 = distinct !DISubprogram(name: "d", scope: !10, file: !10, line: 30, type: !11, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!36 = !DILocalVariable(name: "x", arg: 1, scope: !35, file: !10, line: 30, type: !13)
!37 = !DILocation(line: 30, column: 11, scope: !35)
!38 = !DILocation(line: 31, column: 11, scope: !35)
!39 = !DILocation(line: 31, column: 9, scope: !35)
!40 = !DILocation(line: 31, column: 14, scope: !35)
!41 = !DILocation(line: 31, column: 2, scope: !35)
!42 = distinct !DISubprogram(name: "e", scope: !10, file: !10, line: 34, type: !11, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!43 = !DILocalVariable(name: "x", arg: 1, scope: !42, file: !10, line: 34, type: !13)
!44 = !DILocation(line: 34, column: 11, scope: !42)
!45 = !DILocation(line: 35, column: 11, scope: !42)
!46 = !DILocation(line: 35, column: 9, scope: !42)
!47 = !DILocation(line: 35, column: 14, scope: !42)
!48 = !DILocation(line: 35, column: 2, scope: !42)
!49 = distinct !DISubprogram(name: "f", scope: !10, file: !10, line: 38, type: !11, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!50 = !DILocalVariable(name: "x", arg: 1, scope: !49, file: !10, line: 38, type: !13)
!51 = !DILocation(line: 38, column: 11, scope: !49)
!52 = !DILocation(line: 39, column: 11, scope: !49)
!53 = !DILocation(line: 39, column: 9, scope: !49)
!54 = !DILocation(line: 39, column: 14, scope: !49)
!55 = !DILocation(line: 39, column: 2, scope: !49)
!56 = distinct !DISubprogram(name: "g", scope: !10, file: !10, line: 42, type: !11, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!57 = !DILocalVariable(name: "x", arg: 1, scope: !56, file: !10, line: 42, type: !13)
!58 = !DILocation(line: 42, column: 11, scope: !56)
!59 = !DILocation(line: 43, column: 11, scope: !56)
!60 = !DILocation(line: 43, column: 9, scope: !56)
!61 = !DILocation(line: 43, column: 14, scope: !56)
!62 = !DILocation(line: 43, column: 2, scope: !56)
!63 = distinct !DISubprogram(name: "h", scope: !10, file: !10, line: 46, type: !11, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!64 = !DILocalVariable(name: "x", arg: 1, scope: !63, file: !10, line: 46, type: !13)
!65 = !DILocation(line: 46, column: 11, scope: !63)
!66 = !DILocation(line: 47, column: 11, scope: !63)
!67 = !DILocation(line: 47, column: 9, scope: !63)
!68 = !DILocation(line: 47, column: 14, scope: !63)
!69 = !DILocation(line: 47, column: 2, scope: !63)
!70 = distinct !DISubprogram(name: "z", scope: !10, file: !10, line: 50, type: !11, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!71 = !DILocalVariable(name: "x", arg: 1, scope: !70, file: !10, line: 50, type: !13)
!72 = !DILocation(line: 50, column: 11, scope: !70)
!73 = !DILocation(line: 51, column: 9, scope: !70)
!74 = !DILocation(line: 51, column: 11, scope: !70)
!75 = !DILocation(line: 51, column: 2, scope: !70)
!76 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 54, type: !77, scopeLine: 54, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!77 = !DISubroutineType(types: !78)
!78 = !{!13}
!79 = !DILocalVariable(name: "input", scope: !76, file: !10, line: 55, type: !13)
!80 = !DILocation(line: 55, column: 6, scope: !76)
!81 = !DILocalVariable(name: "result", scope: !76, file: !10, line: 56, type: !13)
!82 = !DILocation(line: 56, column: 6, scope: !76)
!83 = !DILocation(line: 56, column: 17, scope: !76)
!84 = !DILocation(line: 56, column: 15, scope: !76)
!85 = !DILocation(line: 57, column: 13, scope: !76)
!86 = !DILocation(line: 57, column: 23, scope: !76)
!87 = !DILocation(line: 57, column: 29, scope: !76)
!88 = !DILocation(line: 57, column: 20, scope: !76)
!89 = !DILocation(line: 57, column: 2, scope: !76)
!90 = !DILocation(line: 58, column: 1, scope: !76)
