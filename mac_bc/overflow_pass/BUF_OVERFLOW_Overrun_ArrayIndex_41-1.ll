; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_41-1.c"
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
  %mul = mul nsw i32 %0, 2, !dbg !60
  ret i32 %mul, !dbg !61
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !62 {
entry:
  %buffer1 = alloca [129 x i32], align 16
  %buffer2 = alloca [128 x i32], align 16
  %input = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [129 x i32]* %buffer1, metadata !65, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [128 x i32]* %buffer2, metadata !70, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %input, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 2, i32* %input, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata i32* %result, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = load i32, i32* %input, align 4, !dbg !79
  %call = call i32 @a(i32 noundef %0), !dbg !80
  store i32 %call, i32* %result, align 4, !dbg !78
  %1 = load i32, i32* %result, align 4, !dbg !81
  %idxprom = sext i32 %1 to i64, !dbg !82
  %arrayidx = getelementptr inbounds [129 x i32], [129 x i32]* %buffer1, i64 0, i64 %idxprom, !dbg !82
  store i32 1, i32* %arrayidx, align 4, !dbg !83
  %2 = load i32, i32* %result, align 4, !dbg !84
  %idxprom1 = sext i32 %2 to i64, !dbg !85
  %arrayidx2 = getelementptr inbounds [128 x i32], [128 x i32]* %buffer2, i64 0, i64 %idxprom1, !dbg !85
  store i32 1, i32* %arrayidx2, align 4, !dbg !86
  ret i32 0, !dbg !87
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "a", scope: !10, file: !10, line: 17, type: !11, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "x", arg: 1, scope: !9, file: !10, line: 17, type: !13)
!16 = !DILocation(line: 17, column: 11, scope: !9)
!17 = !DILocation(line: 18, column: 11, scope: !9)
!18 = !DILocation(line: 18, column: 9, scope: !9)
!19 = !DILocation(line: 18, column: 14, scope: !9)
!20 = !DILocation(line: 18, column: 2, scope: !9)
!21 = distinct !DISubprogram(name: "b", scope: !10, file: !10, line: 21, type: !11, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!22 = !DILocalVariable(name: "x", arg: 1, scope: !21, file: !10, line: 21, type: !13)
!23 = !DILocation(line: 21, column: 11, scope: !21)
!24 = !DILocation(line: 22, column: 11, scope: !21)
!25 = !DILocation(line: 22, column: 9, scope: !21)
!26 = !DILocation(line: 22, column: 14, scope: !21)
!27 = !DILocation(line: 22, column: 2, scope: !21)
!28 = distinct !DISubprogram(name: "c", scope: !10, file: !10, line: 25, type: !11, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!29 = !DILocalVariable(name: "x", arg: 1, scope: !28, file: !10, line: 25, type: !13)
!30 = !DILocation(line: 25, column: 11, scope: !28)
!31 = !DILocation(line: 26, column: 11, scope: !28)
!32 = !DILocation(line: 26, column: 9, scope: !28)
!33 = !DILocation(line: 26, column: 14, scope: !28)
!34 = !DILocation(line: 26, column: 2, scope: !28)
!35 = distinct !DISubprogram(name: "d", scope: !10, file: !10, line: 29, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!36 = !DILocalVariable(name: "x", arg: 1, scope: !35, file: !10, line: 29, type: !13)
!37 = !DILocation(line: 29, column: 11, scope: !35)
!38 = !DILocation(line: 30, column: 11, scope: !35)
!39 = !DILocation(line: 30, column: 9, scope: !35)
!40 = !DILocation(line: 30, column: 14, scope: !35)
!41 = !DILocation(line: 30, column: 2, scope: !35)
!42 = distinct !DISubprogram(name: "e", scope: !10, file: !10, line: 33, type: !11, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!43 = !DILocalVariable(name: "x", arg: 1, scope: !42, file: !10, line: 33, type: !13)
!44 = !DILocation(line: 33, column: 11, scope: !42)
!45 = !DILocation(line: 34, column: 11, scope: !42)
!46 = !DILocation(line: 34, column: 9, scope: !42)
!47 = !DILocation(line: 34, column: 14, scope: !42)
!48 = !DILocation(line: 34, column: 2, scope: !42)
!49 = distinct !DISubprogram(name: "f", scope: !10, file: !10, line: 37, type: !11, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!50 = !DILocalVariable(name: "x", arg: 1, scope: !49, file: !10, line: 37, type: !13)
!51 = !DILocation(line: 37, column: 11, scope: !49)
!52 = !DILocation(line: 38, column: 11, scope: !49)
!53 = !DILocation(line: 38, column: 9, scope: !49)
!54 = !DILocation(line: 38, column: 14, scope: !49)
!55 = !DILocation(line: 38, column: 2, scope: !49)
!56 = distinct !DISubprogram(name: "g", scope: !10, file: !10, line: 41, type: !11, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!57 = !DILocalVariable(name: "x", arg: 1, scope: !56, file: !10, line: 41, type: !13)
!58 = !DILocation(line: 41, column: 11, scope: !56)
!59 = !DILocation(line: 42, column: 9, scope: !56)
!60 = !DILocation(line: 42, column: 11, scope: !56)
!61 = !DILocation(line: 42, column: 2, scope: !56)
!62 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 45, type: !63, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!63 = !DISubroutineType(types: !64)
!64 = !{!13}
!65 = !DILocalVariable(name: "buffer1", scope: !62, file: !10, line: 46, type: !66)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 4128, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 129)
!69 = !DILocation(line: 46, column: 6, scope: !62)
!70 = !DILocalVariable(name: "buffer2", scope: !62, file: !10, line: 47, type: !71)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 4096, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 128)
!74 = !DILocation(line: 47, column: 6, scope: !62)
!75 = !DILocalVariable(name: "input", scope: !62, file: !10, line: 48, type: !13)
!76 = !DILocation(line: 48, column: 6, scope: !62)
!77 = !DILocalVariable(name: "result", scope: !62, file: !10, line: 49, type: !13)
!78 = !DILocation(line: 49, column: 6, scope: !62)
!79 = !DILocation(line: 49, column: 17, scope: !62)
!80 = !DILocation(line: 49, column: 15, scope: !62)
!81 = !DILocation(line: 51, column: 10, scope: !62)
!82 = !DILocation(line: 51, column: 2, scope: !62)
!83 = !DILocation(line: 51, column: 18, scope: !62)
!84 = !DILocation(line: 52, column: 10, scope: !62)
!85 = !DILocation(line: 52, column: 2, scope: !62)
!86 = !DILocation(line: 52, column: 18, scope: !62)
!87 = !DILocation(line: 53, column: 1, scope: !62)
